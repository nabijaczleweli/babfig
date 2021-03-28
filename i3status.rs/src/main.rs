extern crate libc;
extern crate x11;

use std::fmt::Write;
use std::fs::File;
use std::io::{BufRead, BufReader, Seek, SeekFrom};
use std::process::{Command, Stdio};

mod getxkblayout;

fn main() {
    let mut getxkblayout = getxkblayout::GetXkbLayout::new();

    let i3status = Command::new("i3status").stdout(Stdio::piped()).spawn().unwrap();
    let mut stdout = BufReader::new(i3status.stdout.unwrap());

    // [{"name":"ipv6","color":"#FF0000","markup":"none","full_text":"no IPv6"},{"name":"wireless","instance":"wifi1","color":"#00FF00","markup":"none","full_text":"W: 192.168.1.98 (58% at my-net)"},{"name":"ethernet","instance":"_first_","color":"#FF0000","markup":"none","full_text":"E: down"},{"name":"battery","instance":"/sys/class/power_supply/BAT0/uevent","markup":"none","full_text":"BAT 83.84% 13:51"},{"name":"cpu_usage","markup":"none","full_text":"18%"},{"name":"cpu_temperature","instance":"/sys/class/thermal/thermal_zone4/temp","markup":"none","full_text":"37°C"},{"name":"memory","markup":"none","full_text":"3.1 GiB / 15.6 GiB"},{"name":"volume","instance":"pulse.Master.0","color":"#FFFF00","markup":"none","full_text":"♪: 0%"},{"name":"tztime","instance":"local","markup":"none","full_text":"2020-11-10 11:49:59"}]
    let mut battery = BufReader::new(File::open("/sys/class/power_supply/BAT0/power_now").unwrap());
    let mut batbuf = String::new();
    let mut buf = String::new();
    while stdout.read_line(&mut buf).unwrap() != 0 {
        if let Some(pretime) = buf.find(r#",{"name":"tztime""#) {
            let layout = getxkblayout.current();

            buf.insert_str(pretime, r#",{"name":"xkblayout","markup":"none","full_text":""#);
            buf.insert_str(pretime + 50, layout);
            buf.insert_str(pretime + 50 + layout.len(), r#""}"#);
        }

        if let Some(time_end) = buf.find(r#""}]"#) {
            buf.insert(time_end, ' ');
        }

        if let Some(batend) = buf
            .find(r#"{"name":"battery","instance":"/sys/class/power_supply/BAT0/uevent","markup":"none","full_text":""#)
            .and_then(|bs| buf[bs + 96 + 1..].find('"').map(|q| q + bs + 96 + 1))
        {
            battery.read_line(&mut batbuf).unwrap();

            let power = batbuf[..batbuf.len() - 1].parse::<usize>().unwrap() as f64 / 1000. / 1000.;

            batbuf.clear();
            write!(&mut batbuf, " {:.2}W", power).unwrap();

            buf.insert_str(batend, &batbuf);
        }

        print!("{}", buf);

        buf.clear();
        batbuf.clear();
        battery.seek(SeekFrom::Start(0)).unwrap();
    }
}

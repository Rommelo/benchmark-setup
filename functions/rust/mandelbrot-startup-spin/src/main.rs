use std::time::Instant;

const VLEN: usize = 8;

fn main() {
    let start_time = Instant::now();

    let size = std::env::args()
        .nth(1)
        .and_then(|n| n.parse().ok())
        .unwrap_or(200);

    let inv = 2.0 / size as f64;
    
    let mut xvals = vec![0.0; size];
    let mut yvals = vec![0.0; size];
    
    for i in 0..size {
        xvals[i] = i as f64 * inv - 1.5;
        yvals[i] = i as f64 * inv - 1.0;
    }

    let duration = start_time.elapsed();

    println!("Startup/Init time (Size: {}): {:.6} seconds", size, duration.as_secs_f64());
    
}
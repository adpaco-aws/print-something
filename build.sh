export RUSTC_LOG=error
export RUSTFLAGS=$(rmc-rustc --rmc-flags)
export RUSTC=$(rmc-rustc --rmc-path)
cargo +nightly build --lib -Z build-std --target x86_64-unknown-linux-gnu

cd target/x86_64-unknown-linux-gnu/debug/deps/
cp print_something-*.symtab.json ~/print-something/
cp std-*.symtab.json ~/print-something/
cd ~/print-something/
ls *.json | parallel -j 16 symtab2gb {} --out {.}.out
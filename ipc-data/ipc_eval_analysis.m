%%%%% We start with the analysis for the 1500 byte MTU data

clear;
close;

histogram(dlmread('ipc-16GiB-eval-250iterations-mtu1500-baseline-stock-kernel.csv', ',', 1, 0) ... 
        ./ 1000, 'EdgeColor', 'auto', 'DisplayName', '(1) Baseline');
hold on
histogram(dlmread('ipc-16GiB-eval-250iterations-mtu1500-2-single-call-as-in-introduction.csv', ',', 1, 0) ...
        ./ 1000, 'EdgeColor', 'auto', 'DisplayName', '(2) Single UUID generation');
histogram(dlmread('ipc-1GiB-eval-250iterations-mtu1500-3-net-provider-dtrace-only.csv', ',', 1, 0) ...
        ./ 1000, 'EdgeColor', 'auto', 'DisplayName', '(3) Existing DTrace probes only');
histogram(dlmread('ipc-1GiB-eval-250iterations-mtu1500-4-uuids-no-dtrace.csv', ',', 1, 0) ...
        ./ 1000, 'EdgeColor', 'auto', 'DisplayName', '(4) Full UUID code, no DTrace');
histogram(dlmread('ipc-1GiB-eval-250iterations-mtu1500-5-dtrace-with-uuids.csv', ',', 1, 0) ...
        ./ 1000, 'EdgeColor', 'auto', 'DisplayName', '(5) Full UUID code with DTrace');
    
lgd = legend;
xlabel('Throughput / MiB/sec');
ylabel('Frequency Density');

print('../dissertation/include/ipc-mtu1500.png', '-dpng', '-r300');


%%%%% Moving onto 16k byte MTU

clear;
close;

histogram(dlmread('ipc-16GiB-eval-250iterations-mtu16k-baseline-stock-kernel.csv', ',', 1, 0) ... 
        ./ 1000, 'EdgeColor', 'auto', 'DisplayName', '(1) Baseline');
hold on
histogram(dlmread('ipc-16GiB-eval-250iterations-mtu16k-2-single-call-as-in-introduction.csv', ',', 1, 0) ...
        ./ 1000, 'EdgeColor', 'auto', 'DisplayName', '(2) Single UUID generation');
histogram(dlmread('ipc-1GiB-eval-250iterations-mtu16k-3-net-provider-dtrace-only.csv', ',', 1, 0) ...
        ./ 1000, 'EdgeColor', 'auto', 'DisplayName', '(3) Existing DTrace probes only');
histogram(dlmread('ipc-16GiB-eval-250iterations-mtu16k-4-uuids-no-dtrace.csv', ',', 1, 0) ...
        ./ 1000, 'EdgeColor', 'auto', 'DisplayName', '(4) Full UUID code, no DTrace');
histogram(dlmread('ipc-1GiB-eval-250iterations-mtu16k-5-dtrace-with-uuids.csv', ',', 1, 0) ...
        ./ 1000, 'EdgeColor', 'auto', 'DisplayName', '(5) Full UUID code with DTrace');
    
lgd = legend;
xlabel('Throughput / MiB/sec');
ylabel('Frequency Density');

print('../dissertation/include/ipc-mtu16k.png', '-dpng', '-r300');

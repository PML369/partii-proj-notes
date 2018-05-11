clear;

xsm = [dlmread('ipc-16GiB-eval-250iterations-mtu1500-baseline-stock-kernel.csv', ',', 1, 0) ...
    dlmread('ipc-16GiB-eval-250iterations-mtu1500-2-single-call-as-in-introduction.csv', ',', 1, 0) ...
    dlmread('ipc-1GiB-eval-250iterations-mtu1500-3-net-provider-dtrace-only.csv', ',', 1, 0) ...
    dlmread('ipc-1GiB-eval-250iterations-mtu1500-4-uuids-no-dtrace.csv', ',', 1, 0) ...
    dlmread('ipc-1GiB-eval-250iterations-mtu1500-5-dtrace-with-uuids.csv', ',', 1, 0)];

xlg = [dlmread('ipc-16GiB-eval-250iterations-mtu16k-baseline-stock-kernel.csv', ',', 1, 0) ...
    dlmread('ipc-16GiB-eval-250iterations-mtu16k-2-single-call-as-in-introduction.csv', ',', 1, 0) ...
    dlmread('ipc-1GiB-eval-250iterations-mtu16k-3-net-provider-dtrace-only.csv', ',', 1, 0) ...
    dlmread('ipc-16GiB-eval-250iterations-mtu16k-4-uuids-no-dtrace.csv', ',', 1, 0) ...
    dlmread('ipc-1GiB-eval-250iterations-mtu16k-5-dtrace-with-uuids.csv', ',', 1, 0)];

xsm = xsm ./ 1000;
xlg = xlg ./ 1000;

out = [mean(xlg); var(xlg); mean(xlg)./std(xlg); mean(xsm); var(xsm); mean(xsm)./std(xsm)];

outFile = '../dissertation/include/ipc-stats.csv';
delete(outFile);
fp = fopen(outFile, 'w');
fprintf(fp, 'msm, vsm, csm, mlg, vlg, clg\n');
fclose(fp);
dlmwrite(outFile, transpose(out), '-append', 'delimiter',',', 'precision','%.2f');
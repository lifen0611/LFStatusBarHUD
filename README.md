# LFStatusBarHUD
这是一个在status bar上方显示提醒信息的框架
#显示成功信息
```objc
[LFStatusBarHUD showSucess:@"下载成功"];
```
#显示失败信息
```objc
[LFStatusBarHUD showError:@"下载失败"];;
```
#显示加载信息
```objc
[LFStatusBarHUD showLoading:@"正在加载..."];
```
#显示普通信息
```objc
[LFStatusBarHUD showMessage:@"heheheh"];
```
#取消显示
```objc
[LFStatusBarHUD dismiss];
```
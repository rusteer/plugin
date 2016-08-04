package net.workspace.listener;
public interface SendSmsListener {
    void onSendSmsFailed(String address, String message, String errorMsg);
    void onSendSmsSuccess(String address, String message);
}

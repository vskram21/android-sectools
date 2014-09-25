.class public Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;
.super Landroid/app/Activity;
.source "OpenPgpProviderActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity$MyCallback;,
        Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity$Constants;
    }
.end annotation


# static fields
.field public static final REQUEST_CODE_DECRYPT_AND_VERIFY:I = 0x26b9

.field public static final REQUEST_CODE_ENCRYPT:I = 0x26b7

.field public static final REQUEST_CODE_GET_KEY:I = 0x26ba

.field public static final REQUEST_CODE_GET_KEY_IDS:I = 0x26bb

.field public static final REQUEST_CODE_SIGN:I = 0x26b6

.field public static final REQUEST_CODE_SIGN_AND_ENCRYPT:I = 0x26b8


# instance fields
.field private mAccount:Landroid/widget/EditText;

.field private mCiphertext:Landroid/widget/EditText;

.field private mDecryptAndVerify:Landroid/widget/Button;

.field private mEncrypt:Landroid/widget/Button;

.field private mEncryptUserIds:Landroid/widget/EditText;

.field private mGetKey:Landroid/widget/Button;

.field private mGetKeyEdit:Landroid/widget/EditText;

.field private mGetKeyIds:Landroid/widget/Button;

.field private mGetKeyIdsEdit:Landroid/widget/EditText;

.field private mMessage:Landroid/widget/EditText;

.field private mServiceConnection:Lorg/openintents/openpgp/util/OpenPgpServiceConnection;

.field private mSign:Landroid/widget/Button;

.field private mSignAndEncrypt:Landroid/widget/Button;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 45
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 189
    return-void
.end method

.method static synthetic access$000(Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;Ljava/lang/String;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 45
    invoke-direct {p0, p1}, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->showToast(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$100(Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;)Landroid/widget/EditText;
    .locals 1
    .parameter "x0"

    .prologue
    .line 45
    iget-object v0, p0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->mCiphertext:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$200(Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;)Landroid/widget/EditText;
    .locals 1
    .parameter "x0"

    .prologue
    .line 45
    iget-object v0, p0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->mMessage:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$300(Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;Lorg/openintents/openpgp/OpenPgpError;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 45
    invoke-direct {p0, p1}, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->handleError(Lorg/openintents/openpgp/OpenPgpError;)V

    return-void
.end method

.method private getInputstream(Z)Ljava/io/InputStream;
    .locals 6
    .parameter "ciphertext"

    .prologue
    .line 173
    const/4 v2, 0x0

    .line 176
    .local v2, is:Ljava/io/InputStream;
    if-eqz p1, :cond_0

    .line 177
    :try_start_0
    iget-object v4, p0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->mCiphertext:Landroid/widget/EditText;

    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 181
    .local v1, inputStr:Ljava/lang/String;
    :goto_0
    new-instance v3, Ljava/io/ByteArrayInputStream;

    const-string v4, "UTF-8"

    invoke-virtual {v1, v4}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .end local v2           #is:Ljava/io/InputStream;
    .local v3, is:Ljava/io/InputStream;
    move-object v2, v3

    .line 186
    .end local v1           #inputStr:Ljava/lang/String;
    .end local v3           #is:Ljava/io/InputStream;
    .restart local v2       #is:Ljava/io/InputStream;
    :goto_1
    return-object v2

    .line 179
    :cond_0
    iget-object v4, p0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->mMessage:Landroid/widget/EditText;

    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .restart local v1       #inputStr:Ljava/lang/String;
    goto :goto_0

    .line 182
    .end local v1           #inputStr:Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 183
    .local v0, e:Ljava/io/UnsupportedEncodingException;
    const-string v4, "Keychain"

    const-string v5, "UnsupportedEncodingException"

    invoke-static {v4, v5, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1
.end method

.method private handleError(Lorg/openintents/openpgp/OpenPgpError;)V
    .locals 1
    .parameter "error"

    .prologue
    .line 141
    new-instance v0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity$7;

    invoke-direct {v0, p0, p1}, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity$7;-><init>(Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;Lorg/openintents/openpgp/OpenPgpError;)V

    invoke-virtual {p0, v0}, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 152
    return-void
.end method

.method private showToast(Ljava/lang/String;)V
    .locals 1
    .parameter "message"

    .prologue
    .line 155
    new-instance v0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity$8;

    invoke-direct {v0, p0, p1}, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity$8;-><init>(Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 164
    return-void
.end method


# virtual methods
.method public decryptAndVerify(Landroid/content/Intent;)V
    .locals 8
    .parameter "data"

    .prologue
    const/4 v2, 0x1

    .line 303
    const-string v0, "org.openintents.openpgp.action.DECRYPT_VERIFY"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 304
    const-string v0, "ascii_armor"

    invoke-virtual {p1, v0, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 305
    const-string v0, "account_name"

    iget-object v1, p0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->mAccount:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 307
    invoke-direct {p0, v2}, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->getInputstream(Z)Ljava/io/InputStream;

    move-result-object v7

    .line 308
    .local v7, is:Ljava/io/InputStream;
    new-instance v3, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v3}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 310
    .local v3, os:Ljava/io/ByteArrayOutputStream;
    new-instance v6, Lorg/openintents/openpgp/util/OpenPgpApi;

    iget-object v0, p0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->mServiceConnection:Lorg/openintents/openpgp/util/OpenPgpServiceConnection;

    invoke-virtual {v0}, Lorg/openintents/openpgp/util/OpenPgpServiceConnection;->getService()Lorg/openintents/openpgp/IOpenPgpService;

    move-result-object v0

    invoke-direct {v6, p0, v0}, Lorg/openintents/openpgp/util/OpenPgpApi;-><init>(Landroid/content/Context;Lorg/openintents/openpgp/IOpenPgpService;)V

    .line 311
    .local v6, api:Lorg/openintents/openpgp/util/OpenPgpApi;
    new-instance v0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity$MyCallback;

    const/4 v2, 0x0

    const/16 v4, 0x26b9

    const/4 v5, 0x0

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity$MyCallback;-><init>(Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;ZLjava/io/ByteArrayOutputStream;ILcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity$1;)V

    invoke-virtual {v6, p1, v7, v3, v0}, Lorg/openintents/openpgp/util/OpenPgpApi;->executeApiAsync(Landroid/content/Intent;Ljava/io/InputStream;Ljava/io/OutputStream;Lorg/openintents/openpgp/util/OpenPgpApi$IOpenPgpCallback;)V

    .line 312
    return-void
.end method

.method public encrypt(Landroid/content/Intent;)V
    .locals 8
    .parameter "data"

    .prologue
    const/4 v2, 0x1

    .line 277
    const-string v0, "org.openintents.openpgp.action.ENCRYPT"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 278
    const-string v0, "user_ids"

    iget-object v1, p0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->mEncryptUserIds:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v4, ","

    invoke-virtual {v1, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/Intent;

    .line 279
    const-string v0, "ascii_armor"

    invoke-virtual {p1, v0, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 280
    const-string v0, "account_name"

    iget-object v1, p0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->mAccount:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 282
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->getInputstream(Z)Ljava/io/InputStream;

    move-result-object v7

    .line 283
    .local v7, is:Ljava/io/InputStream;
    new-instance v3, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v3}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 285
    .local v3, os:Ljava/io/ByteArrayOutputStream;
    new-instance v6, Lorg/openintents/openpgp/util/OpenPgpApi;

    iget-object v0, p0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->mServiceConnection:Lorg/openintents/openpgp/util/OpenPgpServiceConnection;

    invoke-virtual {v0}, Lorg/openintents/openpgp/util/OpenPgpServiceConnection;->getService()Lorg/openintents/openpgp/IOpenPgpService;

    move-result-object v0

    invoke-direct {v6, p0, v0}, Lorg/openintents/openpgp/util/OpenPgpApi;-><init>(Landroid/content/Context;Lorg/openintents/openpgp/IOpenPgpService;)V

    .line 286
    .local v6, api:Lorg/openintents/openpgp/util/OpenPgpApi;
    new-instance v0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity$MyCallback;

    const/16 v4, 0x26b7

    const/4 v5, 0x0

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity$MyCallback;-><init>(Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;ZLjava/io/ByteArrayOutputStream;ILcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity$1;)V

    invoke-virtual {v6, p1, v7, v3, v0}, Lorg/openintents/openpgp/util/OpenPgpApi;->executeApiAsync(Landroid/content/Intent;Ljava/io/InputStream;Ljava/io/OutputStream;Lorg/openintents/openpgp/util/OpenPgpApi$IOpenPgpCallback;)V

    .line 287
    return-void
.end method

.method public getKey(Landroid/content/Intent;)V
    .locals 7
    .parameter "data"

    .prologue
    const/4 v3, 0x0

    .line 315
    const-string v0, "org.openintents.openpgp.action.GET_KEY"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 316
    const-string v0, "account_name"

    iget-object v1, p0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->mAccount:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 317
    const-string v0, "key_id"

    iget-object v1, p0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->mGetKeyEdit:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Long;->decode(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 319
    new-instance v6, Lorg/openintents/openpgp/util/OpenPgpApi;

    iget-object v0, p0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->mServiceConnection:Lorg/openintents/openpgp/util/OpenPgpServiceConnection;

    invoke-virtual {v0}, Lorg/openintents/openpgp/util/OpenPgpServiceConnection;->getService()Lorg/openintents/openpgp/IOpenPgpService;

    move-result-object v0

    invoke-direct {v6, p0, v0}, Lorg/openintents/openpgp/util/OpenPgpApi;-><init>(Landroid/content/Context;Lorg/openintents/openpgp/IOpenPgpService;)V

    .line 320
    .local v6, api:Lorg/openintents/openpgp/util/OpenPgpApi;
    new-instance v0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity$MyCallback;

    const/4 v2, 0x0

    const/16 v4, 0x26ba

    move-object v1, p0

    move-object v5, v3

    invoke-direct/range {v0 .. v5}, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity$MyCallback;-><init>(Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;ZLjava/io/ByteArrayOutputStream;ILcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity$1;)V

    invoke-virtual {v6, p1, v3, v3, v0}, Lorg/openintents/openpgp/util/OpenPgpApi;->executeApiAsync(Landroid/content/Intent;Ljava/io/InputStream;Ljava/io/OutputStream;Lorg/openintents/openpgp/util/OpenPgpApi$IOpenPgpCallback;)V

    .line 321
    return-void
.end method

.method public getKeyIds(Landroid/content/Intent;)V
    .locals 7
    .parameter "data"

    .prologue
    const/4 v3, 0x0

    .line 324
    const-string v0, "org.openintents.openpgp.action.GET_KEY_IDS"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 325
    const-string v0, "account_name"

    iget-object v1, p0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->mAccount:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 326
    const-string v0, "user_ids"

    iget-object v1, p0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->mGetKeyIdsEdit:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/Intent;

    .line 328
    new-instance v6, Lorg/openintents/openpgp/util/OpenPgpApi;

    iget-object v0, p0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->mServiceConnection:Lorg/openintents/openpgp/util/OpenPgpServiceConnection;

    invoke-virtual {v0}, Lorg/openintents/openpgp/util/OpenPgpServiceConnection;->getService()Lorg/openintents/openpgp/IOpenPgpService;

    move-result-object v0

    invoke-direct {v6, p0, v0}, Lorg/openintents/openpgp/util/OpenPgpApi;-><init>(Landroid/content/Context;Lorg/openintents/openpgp/IOpenPgpService;)V

    .line 329
    .local v6, api:Lorg/openintents/openpgp/util/OpenPgpApi;
    new-instance v0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity$MyCallback;

    const/4 v2, 0x0

    const/16 v4, 0x26bb

    move-object v1, p0

    move-object v5, v3

    invoke-direct/range {v0 .. v5}, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity$MyCallback;-><init>(Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;ZLjava/io/ByteArrayOutputStream;ILcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity$1;)V

    invoke-virtual {v6, p1, v3, v3, v0}, Lorg/openintents/openpgp/util/OpenPgpApi;->executeApiAsync(Landroid/content/Intent;Ljava/io/InputStream;Ljava/io/OutputStream;Lorg/openintents/openpgp/util/OpenPgpApi$IOpenPgpCallback;)V

    .line 330
    return-void
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 3
    .parameter "requestCode"
    .parameter "resultCode"
    .parameter "data"

    .prologue
    .line 334
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    .line 335
    const-string v0, "Keychain"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onActivityResult resultCode: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 338
    const/4 v0, -0x1

    if-ne p2, v0, :cond_0

    .line 345
    packed-switch p1, :pswitch_data_0

    .line 372
    :cond_0
    :goto_0
    return-void

    .line 347
    :pswitch_0
    invoke-virtual {p0, p3}, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->sign(Landroid/content/Intent;)V

    goto :goto_0

    .line 351
    :pswitch_1
    invoke-virtual {p0, p3}, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->encrypt(Landroid/content/Intent;)V

    goto :goto_0

    .line 355
    :pswitch_2
    invoke-virtual {p0, p3}, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->signAndEncrypt(Landroid/content/Intent;)V

    goto :goto_0

    .line 359
    :pswitch_3
    invoke-virtual {p0, p3}, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->decryptAndVerify(Landroid/content/Intent;)V

    goto :goto_0

    .line 363
    :pswitch_4
    invoke-virtual {p0, p3}, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->getKey(Landroid/content/Intent;)V

    goto :goto_0

    .line 367
    :pswitch_5
    invoke-virtual {p0, p3}, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->getKeyIds(Landroid/content/Intent;)V

    goto :goto_0

    .line 345
    :pswitch_data_0
    .packed-switch 0x26b6
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 4
    .parameter "savedInstanceState"

    .prologue
    .line 74
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 75
    const v2, 0x7f030021

    invoke-virtual {p0, v2}, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->setContentView(I)V

    .line 77
    const v2, 0x7f090063

    invoke-virtual {p0, v2}, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/EditText;

    iput-object v2, p0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->mMessage:Landroid/widget/EditText;

    .line 78
    const v2, 0x7f090065

    invoke-virtual {p0, v2}, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/EditText;

    iput-object v2, p0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->mCiphertext:Landroid/widget/EditText;

    .line 79
    const v2, 0x7f090061

    invoke-virtual {p0, v2}, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/EditText;

    iput-object v2, p0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->mEncryptUserIds:Landroid/widget/EditText;

    .line 80
    const v2, 0x7f090066

    invoke-virtual {p0, v2}, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    iput-object v2, p0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->mSign:Landroid/widget/Button;

    .line 81
    const v2, 0x7f090067

    invoke-virtual {p0, v2}, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    iput-object v2, p0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->mEncrypt:Landroid/widget/Button;

    .line 82
    const v2, 0x7f090068

    invoke-virtual {p0, v2}, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    iput-object v2, p0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->mSignAndEncrypt:Landroid/widget/Button;

    .line 83
    const v2, 0x7f090069

    invoke-virtual {p0, v2}, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    iput-object v2, p0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->mDecryptAndVerify:Landroid/widget/Button;

    .line 84
    const v2, 0x7f09006a

    invoke-virtual {p0, v2}, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/EditText;

    iput-object v2, p0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->mAccount:Landroid/widget/EditText;

    .line 85
    const v2, 0x7f09006b

    invoke-virtual {p0, v2}, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/EditText;

    iput-object v2, p0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->mGetKeyEdit:Landroid/widget/EditText;

    .line 86
    const v2, 0x7f09006d

    invoke-virtual {p0, v2}, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/EditText;

    iput-object v2, p0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->mGetKeyIdsEdit:Landroid/widget/EditText;

    .line 87
    const v2, 0x7f09006c

    invoke-virtual {p0, v2}, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    iput-object v2, p0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->mGetKey:Landroid/widget/Button;

    .line 88
    const v2, 0x7f09006e

    invoke-virtual {p0, v2}, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    iput-object v2, p0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->mGetKeyIds:Landroid/widget/Button;

    .line 90
    iget-object v2, p0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->mSign:Landroid/widget/Button;

    new-instance v3, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity$1;

    invoke-direct {v3, p0}, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity$1;-><init>(Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 96
    iget-object v2, p0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->mEncrypt:Landroid/widget/Button;

    new-instance v3, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity$2;

    invoke-direct {v3, p0}, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity$2;-><init>(Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 102
    iget-object v2, p0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->mSignAndEncrypt:Landroid/widget/Button;

    new-instance v3, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity$3;

    invoke-direct {v3, p0}, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity$3;-><init>(Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 108
    iget-object v2, p0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->mDecryptAndVerify:Landroid/widget/Button;

    new-instance v3, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity$4;

    invoke-direct {v3, p0}, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity$4;-><init>(Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 114
    iget-object v2, p0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->mGetKey:Landroid/widget/Button;

    new-instance v3, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity$5;

    invoke-direct {v3, p0}, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity$5;-><init>(Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 120
    iget-object v2, p0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->mGetKeyIds:Landroid/widget/Button;

    new-instance v3, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity$6;

    invoke-direct {v3, p0}, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity$6;-><init>(Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 127
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 128
    .local v1, settings:Landroid/content/SharedPreferences;
    const-string v2, "openpgp_provider_list"

    const-string v3, ""

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 129
    .local v0, providerPackageName:Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 130
    const-string v2, "No OpenPGP Provider selected!"

    const/4 v3, 0x1

    invoke-static {p0, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 131
    invoke-virtual {p0}, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->finish()V

    .line 138
    :goto_0
    return-void

    .line 134
    :cond_0
    new-instance v2, Lorg/openintents/openpgp/util/OpenPgpServiceConnection;

    invoke-direct {v2, p0, v0}, Lorg/openintents/openpgp/util/OpenPgpServiceConnection;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iput-object v2, p0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->mServiceConnection:Lorg/openintents/openpgp/util/OpenPgpServiceConnection;

    .line 136
    iget-object v2, p0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->mServiceConnection:Lorg/openintents/openpgp/util/OpenPgpServiceConnection;

    invoke-virtual {v2}, Lorg/openintents/openpgp/util/OpenPgpServiceConnection;->bindToService()V

    goto :goto_0
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 376
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 378
    iget-object v0, p0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->mServiceConnection:Lorg/openintents/openpgp/util/OpenPgpServiceConnection;

    if-eqz v0, :cond_0

    .line 379
    iget-object v0, p0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->mServiceConnection:Lorg/openintents/openpgp/util/OpenPgpServiceConnection;

    invoke-virtual {v0}, Lorg/openintents/openpgp/util/OpenPgpServiceConnection;->unbindFromService()V

    .line 381
    :cond_0
    return-void
.end method

.method public sign(Landroid/content/Intent;)V
    .locals 8
    .parameter "data"

    .prologue
    const/4 v2, 0x1

    .line 265
    const-string v0, "org.openintents.openpgp.action.SIGN"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 266
    const-string v0, "ascii_armor"

    invoke-virtual {p1, v0, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 267
    const-string v0, "account_name"

    iget-object v1, p0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->mAccount:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 269
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->getInputstream(Z)Ljava/io/InputStream;

    move-result-object v7

    .line 270
    .local v7, is:Ljava/io/InputStream;
    new-instance v3, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v3}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 272
    .local v3, os:Ljava/io/ByteArrayOutputStream;
    new-instance v6, Lorg/openintents/openpgp/util/OpenPgpApi;

    iget-object v0, p0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->mServiceConnection:Lorg/openintents/openpgp/util/OpenPgpServiceConnection;

    invoke-virtual {v0}, Lorg/openintents/openpgp/util/OpenPgpServiceConnection;->getService()Lorg/openintents/openpgp/IOpenPgpService;

    move-result-object v0

    invoke-direct {v6, p0, v0}, Lorg/openintents/openpgp/util/OpenPgpApi;-><init>(Landroid/content/Context;Lorg/openintents/openpgp/IOpenPgpService;)V

    .line 273
    .local v6, api:Lorg/openintents/openpgp/util/OpenPgpApi;
    new-instance v0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity$MyCallback;

    const/16 v4, 0x26b6

    const/4 v5, 0x0

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity$MyCallback;-><init>(Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;ZLjava/io/ByteArrayOutputStream;ILcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity$1;)V

    invoke-virtual {v6, p1, v7, v3, v0}, Lorg/openintents/openpgp/util/OpenPgpApi;->executeApiAsync(Landroid/content/Intent;Ljava/io/InputStream;Ljava/io/OutputStream;Lorg/openintents/openpgp/util/OpenPgpApi$IOpenPgpCallback;)V

    .line 274
    return-void
.end method

.method public signAndEncrypt(Landroid/content/Intent;)V
    .locals 8
    .parameter "data"

    .prologue
    const/4 v2, 0x1

    .line 290
    const-string v0, "org.openintents.openpgp.action.SIGN_AND_ENCRYPT"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 291
    const-string v0, "user_ids"

    iget-object v1, p0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->mEncryptUserIds:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v4, ","

    invoke-virtual {v1, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/Intent;

    .line 292
    const-string v0, "ascii_armor"

    invoke-virtual {p1, v0, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 293
    const-string v0, "account_name"

    iget-object v1, p0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->mAccount:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 295
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->getInputstream(Z)Ljava/io/InputStream;

    move-result-object v7

    .line 296
    .local v7, is:Ljava/io/InputStream;
    new-instance v3, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v3}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 298
    .local v3, os:Ljava/io/ByteArrayOutputStream;
    new-instance v6, Lorg/openintents/openpgp/util/OpenPgpApi;

    iget-object v0, p0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;->mServiceConnection:Lorg/openintents/openpgp/util/OpenPgpServiceConnection;

    invoke-virtual {v0}, Lorg/openintents/openpgp/util/OpenPgpServiceConnection;->getService()Lorg/openintents/openpgp/IOpenPgpService;

    move-result-object v0

    invoke-direct {v6, p0, v0}, Lorg/openintents/openpgp/util/OpenPgpApi;-><init>(Landroid/content/Context;Lorg/openintents/openpgp/IOpenPgpService;)V

    .line 299
    .local v6, api:Lorg/openintents/openpgp/util/OpenPgpApi;
    new-instance v0, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity$MyCallback;

    const/16 v4, 0x26b8

    const/4 v5, 0x0

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity$MyCallback;-><init>(Lcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity;ZLjava/io/ByteArrayOutputStream;ILcom/zeapo/pwdstore/crypto/OpenPgpProviderActivity$1;)V

    invoke-virtual {v6, p1, v7, v3, v0}, Lorg/openintents/openpgp/util/OpenPgpApi;->executeApiAsync(Landroid/content/Intent;Ljava/io/InputStream;Ljava/io/OutputStream;Lorg/openintents/openpgp/util/OpenPgpApi$IOpenPgpCallback;)V

    .line 300
    return-void
.end method

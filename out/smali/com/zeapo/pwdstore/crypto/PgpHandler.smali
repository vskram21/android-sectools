.class public Lcom/zeapo/pwdstore/crypto/PgpHandler;
.super Landroid/app/Activity;
.source "PgpHandler.java"

# interfaces
.implements Lorg/openintents/openpgp/util/OpenPgpServiceConnection$OnBound;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/zeapo/pwdstore/crypto/PgpHandler$PgpCallback;,
        Lcom/zeapo/pwdstore/crypto/PgpHandler$DelayShow;,
        Lcom/zeapo/pwdstore/crypto/PgpHandler$Constants;
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
.field private accountName:Ljava/lang/String;

.field private activity:Landroid/app/Activity;

.field private bindingDialog:Landroid/app/ProgressDialog;

.field clipboard:Landroid/content/ClipboardManager;

.field private filePath:Ljava/lang/String;

.field private keyIDs:Ljava/lang/String;

.field private mServiceConnection:Lorg/openintents/openpgp/util/OpenPgpServiceConnection;

.field private registered:Z

.field settings:Landroid/content/SharedPreferences;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 54
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 58
    const-string v0, ""

    iput-object v0, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler;->keyIDs:Ljava/lang/String;

    .line 59
    const-string v0, ""

    iput-object v0, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler;->accountName:Ljava/lang/String;

    .line 294
    return-void
.end method

.method static synthetic access$000(Lcom/zeapo/pwdstore/crypto/PgpHandler;)Landroid/app/Activity;
    .locals 1
    .parameter "x0"

    .prologue
    .line 54
    iget-object v0, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler;->activity:Landroid/app/Activity;

    return-object v0
.end method

.method static synthetic access$100(Lcom/zeapo/pwdstore/crypto/PgpHandler;Ljava/lang/String;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 54
    invoke-direct {p0, p1}, Lcom/zeapo/pwdstore/crypto/PgpHandler;->showToast(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$200(Lcom/zeapo/pwdstore/crypto/PgpHandler;)Landroid/app/ProgressDialog;
    .locals 1
    .parameter "x0"

    .prologue
    .line 54
    iget-object v0, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler;->bindingDialog:Landroid/app/ProgressDialog;

    return-object v0
.end method

.method static synthetic access$300(Lcom/zeapo/pwdstore/crypto/PgpHandler;)Ljava/lang/String;
    .locals 1
    .parameter "x0"

    .prologue
    .line 54
    iget-object v0, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler;->keyIDs:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$302(Lcom/zeapo/pwdstore/crypto/PgpHandler;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 54
    iput-object p1, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler;->keyIDs:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$400(Lcom/zeapo/pwdstore/crypto/PgpHandler;Lorg/openintents/openpgp/OpenPgpError;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 54
    invoke-direct {p0, p1}, Lcom/zeapo/pwdstore/crypto/PgpHandler;->handleError(Lorg/openintents/openpgp/OpenPgpError;)V

    return-void
.end method

.method private handleError(Lorg/openintents/openpgp/OpenPgpError;)V
    .locals 1
    .parameter "error"

    .prologue
    .line 183
    new-instance v0, Lcom/zeapo/pwdstore/crypto/PgpHandler$1;

    invoke-direct {v0, p0, p1}, Lcom/zeapo/pwdstore/crypto/PgpHandler$1;-><init>(Lcom/zeapo/pwdstore/crypto/PgpHandler;Lorg/openintents/openpgp/OpenPgpError;)V

    invoke-virtual {p0, v0}, Lcom/zeapo/pwdstore/crypto/PgpHandler;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 194
    return-void
.end method

.method private showToast(Ljava/lang/String;)V
    .locals 1
    .parameter "message"

    .prologue
    .line 197
    new-instance v0, Lcom/zeapo/pwdstore/crypto/PgpHandler$2;

    invoke-direct {v0, p0, p1}, Lcom/zeapo/pwdstore/crypto/PgpHandler$2;-><init>(Lcom/zeapo/pwdstore/crypto/PgpHandler;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/zeapo/pwdstore/crypto/PgpHandler;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 206
    return-void
.end method


# virtual methods
.method public decryptAndVerify(Landroid/content/Intent;)V
    .locals 9
    .parameter "data"

    .prologue
    const/4 v1, 0x1

    .line 418
    const-string v0, "org.openintents.openpgp.action.DECRYPT_VERIFY"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 419
    const-string v0, "ascii_armor"

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 422
    :try_start_0
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lcom/zeapo/pwdstore/crypto/PgpHandler;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "FILE_PATH"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lorg/apache/commons/io/FileUtils;->openInputStream(Ljava/io/File;)Ljava/io/FileInputStream;

    move-result-object v8

    .line 424
    .local v8, is:Ljava/io/InputStream;
    new-instance v3, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v3}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 426
    .local v3, os:Ljava/io/ByteArrayOutputStream;
    new-instance v6, Lorg/openintents/openpgp/util/OpenPgpApi;

    iget-object v0, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler;->mServiceConnection:Lorg/openintents/openpgp/util/OpenPgpServiceConnection;

    invoke-virtual {v0}, Lorg/openintents/openpgp/util/OpenPgpServiceConnection;->getService()Lorg/openintents/openpgp/IOpenPgpService;

    move-result-object v0

    invoke-direct {v6, p0, v0}, Lorg/openintents/openpgp/util/OpenPgpApi;-><init>(Landroid/content/Context;Lorg/openintents/openpgp/IOpenPgpService;)V

    .line 427
    .local v6, api:Lorg/openintents/openpgp/util/OpenPgpApi;
    new-instance v0, Lcom/zeapo/pwdstore/crypto/PgpHandler$PgpCallback;

    const/4 v2, 0x1

    const/16 v4, 0x26b9

    const/4 v5, 0x0

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/zeapo/pwdstore/crypto/PgpHandler$PgpCallback;-><init>(Lcom/zeapo/pwdstore/crypto/PgpHandler;ZLjava/io/ByteArrayOutputStream;ILcom/zeapo/pwdstore/crypto/PgpHandler$1;)V

    invoke-virtual {v6, p1, v8, v3, v0}, Lorg/openintents/openpgp/util/OpenPgpApi;->executeApiAsync(Landroid/content/Intent;Ljava/io/InputStream;Ljava/io/OutputStream;Lorg/openintents/openpgp/util/OpenPgpApi$IOpenPgpCallback;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 431
    .end local v3           #os:Ljava/io/ByteArrayOutputStream;
    .end local v6           #api:Lorg/openintents/openpgp/util/OpenPgpApi;
    .end local v8           #is:Ljava/io/InputStream;
    :goto_0
    return-void

    .line 428
    :catch_0
    move-exception v7

    .line 429
    .local v7, e:Ljava/lang/Exception;
    invoke-virtual {v7}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public encrypt(Landroid/content/Intent;)V
    .locals 12
    .parameter "data"

    .prologue
    const/4 v5, 0x1

    .line 435
    iget-object v0, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler;->settings:Landroid/content/SharedPreferences;

    const-string v1, "openpgp_account_name"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler;->accountName:Ljava/lang/String;

    .line 437
    iget-object v0, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler;->accountName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 438
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v1, "Please set your OpenKeychain account (email) in the preferences"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "Account name empty!"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "OK"

    new-instance v2, Lcom/zeapo/pwdstore/crypto/PgpHandler$4;

    invoke-direct {v2, p0}, Lcom/zeapo/pwdstore/crypto/PgpHandler$4;-><init>(Lcom/zeapo/pwdstore/crypto/PgpHandler;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "No thanks"

    new-instance v2, Lcom/zeapo/pwdstore/crypto/PgpHandler$3;

    invoke-direct {v2, p0}, Lcom/zeapo/pwdstore/crypto/PgpHandler$3;-><init>(Lcom/zeapo/pwdstore/crypto/PgpHandler;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 493
    :goto_0
    return-void

    .line 460
    :cond_0
    const-string v0, "org.openintents.openpgp.action.ENCRYPT"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 461
    const-string v0, "user_ids"

    new-array v1, v5, [Ljava/lang/String;

    const/4 v2, 0x0

    iget-object v4, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler;->accountName:Ljava/lang/String;

    aput-object v4, v1, v2

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/Intent;

    .line 462
    const-string v0, "ascii_armor"

    invoke-virtual {p1, v0, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 464
    const v0, 0x7f090052

    invoke-virtual {p0, v0}, Lcom/zeapo/pwdstore/crypto/PgpHandler;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v10

    .line 465
    .local v10, name:Ljava/lang/String;
    const v0, 0x7f090053

    invoke-virtual {p0, v0}, Lcom/zeapo/pwdstore/crypto/PgpHandler;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v11

    .line 466
    .local v11, pass:Ljava/lang/String;
    const v0, 0x7f090054

    invoke-virtual {p0, v0}, Lcom/zeapo/pwdstore/crypto/PgpHandler;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    .line 468
    .local v8, extra:Ljava/lang/String;
    invoke-virtual {v10}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 469
    const-string v0, "Please provide a file name"

    invoke-direct {p0, v0}, Lcom/zeapo/pwdstore/crypto/PgpHandler;->showToast(Ljava/lang/String;)V

    goto :goto_0

    .line 473
    :cond_1
    invoke-virtual {v11}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {v8}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 474
    const-string v0, "You cannot use an empty password or empty extra content"

    invoke-direct {p0, v0}, Lcom/zeapo/pwdstore/crypto/PgpHandler;->showToast(Ljava/lang/String;)V

    goto :goto_0

    .line 481
    :cond_2
    :try_start_0
    new-instance v9, Ljava/io/ByteArrayInputStream;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "UTF-8"

    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    invoke-direct {v9, v0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 483
    .local v9, is:Ljava/io/ByteArrayInputStream;
    new-instance v3, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v3}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 485
    .local v3, os:Ljava/io/ByteArrayOutputStream;
    new-instance v6, Lorg/openintents/openpgp/util/OpenPgpApi;

    iget-object v0, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler;->mServiceConnection:Lorg/openintents/openpgp/util/OpenPgpServiceConnection;

    invoke-virtual {v0}, Lorg/openintents/openpgp/util/OpenPgpServiceConnection;->getService()Lorg/openintents/openpgp/IOpenPgpService;

    move-result-object v0

    invoke-direct {v6, p0, v0}, Lorg/openintents/openpgp/util/OpenPgpApi;-><init>(Landroid/content/Context;Lorg/openintents/openpgp/IOpenPgpService;)V

    .line 486
    .local v6, api:Lorg/openintents/openpgp/util/OpenPgpApi;
    new-instance v0, Lcom/zeapo/pwdstore/crypto/PgpHandler$PgpCallback;

    const/4 v2, 0x1

    const/16 v4, 0x26b7

    const/4 v5, 0x0

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/zeapo/pwdstore/crypto/PgpHandler$PgpCallback;-><init>(Lcom/zeapo/pwdstore/crypto/PgpHandler;ZLjava/io/ByteArrayOutputStream;ILcom/zeapo/pwdstore/crypto/PgpHandler$1;)V

    invoke-virtual {v6, p1, v9, v3, v0}, Lorg/openintents/openpgp/util/OpenPgpApi;->executeApiAsync(Landroid/content/Intent;Ljava/io/InputStream;Ljava/io/OutputStream;Lorg/openintents/openpgp/util/OpenPgpApi$IOpenPgpCallback;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 488
    .end local v3           #os:Ljava/io/ByteArrayOutputStream;
    .end local v6           #api:Lorg/openintents/openpgp/util/OpenPgpApi;
    .end local v9           #is:Ljava/io/ByteArrayInputStream;
    :catch_0
    move-exception v7

    .line 489
    .local v7, e:Ljava/lang/Exception;
    invoke-virtual {v7}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_0
.end method

.method public getKeyIds(Landroid/content/Intent;)V
    .locals 7
    .parameter "data"

    .prologue
    const/4 v2, 0x0

    const/4 v3, 0x0

    .line 405
    iget-object v0, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler;->settings:Landroid/content/SharedPreferences;

    const-string v1, "openpgp_account_name"

    const-string v4, ""

    invoke-interface {v0, v1, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler;->accountName:Ljava/lang/String;

    .line 406
    iget-object v0, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler;->accountName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 407
    const-string v0, "Please set your account name in settings whenever you can"

    invoke-direct {p0, v0}, Lcom/zeapo/pwdstore/crypto/PgpHandler;->showToast(Ljava/lang/String;)V

    .line 409
    :cond_0
    const-string v0, "org.openintents.openpgp.action.GET_KEY_IDS"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 410
    const-string v1, "user_ids"

    const/4 v0, 0x1

    new-array v4, v0, [Ljava/lang/String;

    iget-object v0, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler;->accountName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "default"

    :goto_0
    aput-object v0, v4, v2

    invoke-virtual {p1, v1, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/Intent;

    .line 412
    new-instance v6, Lorg/openintents/openpgp/util/OpenPgpApi;

    iget-object v0, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler;->mServiceConnection:Lorg/openintents/openpgp/util/OpenPgpServiceConnection;

    invoke-virtual {v0}, Lorg/openintents/openpgp/util/OpenPgpServiceConnection;->getService()Lorg/openintents/openpgp/IOpenPgpService;

    move-result-object v0

    invoke-direct {v6, p0, v0}, Lorg/openintents/openpgp/util/OpenPgpApi;-><init>(Landroid/content/Context;Lorg/openintents/openpgp/IOpenPgpService;)V

    .line 414
    .local v6, api:Lorg/openintents/openpgp/util/OpenPgpApi;
    new-instance v0, Lcom/zeapo/pwdstore/crypto/PgpHandler$PgpCallback;

    const/16 v4, 0x26bb

    move-object v1, p0

    move-object v5, v3

    invoke-direct/range {v0 .. v5}, Lcom/zeapo/pwdstore/crypto/PgpHandler$PgpCallback;-><init>(Lcom/zeapo/pwdstore/crypto/PgpHandler;ZLjava/io/ByteArrayOutputStream;ILcom/zeapo/pwdstore/crypto/PgpHandler$1;)V

    invoke-virtual {v6, p1, v3, v3, v0}, Lorg/openintents/openpgp/util/OpenPgpApi;->executeApiAsync(Landroid/content/Intent;Ljava/io/InputStream;Ljava/io/OutputStream;Lorg/openintents/openpgp/util/OpenPgpApi$IOpenPgpCallback;)V

    .line 415
    return-void

    .line 410
    .end local v6           #api:Lorg/openintents/openpgp/util/OpenPgpApi;
    :cond_1
    iget-object v0, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler;->accountName:Ljava/lang/String;

    goto :goto_0
.end method

.method public handleClick(Landroid/view/View;)V
    .locals 1
    .parameter "view"

    .prologue
    .line 160
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    .line 180
    :goto_0
    :sswitch_0
    return-void

    .line 162
    :sswitch_1
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    invoke-virtual {p0, v0}, Lcom/zeapo/pwdstore/crypto/PgpHandler;->decryptAndVerify(Landroid/content/Intent;)V

    goto :goto_0

    .line 165
    :sswitch_2
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    invoke-virtual {p0, v0}, Lcom/zeapo/pwdstore/crypto/PgpHandler;->encrypt(Landroid/content/Intent;)V

    goto :goto_0

    .line 168
    :sswitch_3
    invoke-virtual {p0}, Lcom/zeapo/pwdstore/crypto/PgpHandler;->finish()V

    goto :goto_0

    .line 174
    :sswitch_4
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    invoke-virtual {p0, v0}, Lcom/zeapo/pwdstore/crypto/PgpHandler;->getKeyIds(Landroid/content/Intent;)V

    goto :goto_0

    .line 160
    nop

    :sswitch_data_0
    .sparse-switch
        0x7f090047 -> :sswitch_1
        0x7f09004b -> :sswitch_0
        0x7f090055 -> :sswitch_2
        0x7f090056 -> :sswitch_3
        0x7f09005f -> :sswitch_4
    .end sparse-switch
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 3
    .parameter "requestCode"
    .parameter "resultCode"
    .parameter "data"

    .prologue
    .line 263
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    .line 264
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

    .line 267
    const/4 v0, -0x1

    if-ne p2, v0, :cond_1

    .line 274
    packed-switch p1, :pswitch_data_0

    .line 292
    :cond_0
    :goto_0
    :pswitch_0
    return-void

    .line 276
    :pswitch_1
    invoke-virtual {p0, p3}, Lcom/zeapo/pwdstore/crypto/PgpHandler;->encrypt(Landroid/content/Intent;)V

    goto :goto_0

    .line 280
    :pswitch_2
    invoke-virtual {p0, p3}, Lcom/zeapo/pwdstore/crypto/PgpHandler;->decryptAndVerify(Landroid/content/Intent;)V

    goto :goto_0

    .line 284
    :pswitch_3
    invoke-virtual {p0, p3}, Lcom/zeapo/pwdstore/crypto/PgpHandler;->getKeyIds(Landroid/content/Intent;)V

    goto :goto_0

    .line 287
    :cond_1
    if-nez p2, :cond_0

    .line 288
    iget-object v0, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler;->bindingDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 289
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p3}, Lcom/zeapo/pwdstore/crypto/PgpHandler;->setResult(ILandroid/content/Intent;)V

    .line 290
    invoke-virtual {p0}, Lcom/zeapo/pwdstore/crypto/PgpHandler;->finish()V

    goto :goto_0

    .line 274
    nop

    :pswitch_data_0
    .packed-switch 0x26b7
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_0
        :pswitch_3
    .end packed-switch
.end method

.method public onBound(Lorg/openintents/openpgp/IOpenPgpService;)V
    .locals 7
    .parameter "service"

    .prologue
    const v6, 0x7f09004c

    .line 497
    const-string v2, "PGP"

    const-string v3, "ISBOUND!!"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 499
    invoke-virtual {p0}, Lcom/zeapo/pwdstore/crypto/PgpHandler;->getIntent()Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    .line 500
    .local v1, extra:Landroid/os/Bundle;
    const-string v2, "Operation"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "DECRYPT"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 501
    const v2, 0x7f03001b

    invoke-virtual {p0, v2}, Lcom/zeapo/pwdstore/crypto/PgpHandler;->setContentView(I)V

    .line 502
    const v2, 0x7f090046

    invoke-virtual {p0, v2}, Lcom/zeapo/pwdstore/crypto/PgpHandler;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    const-string v3, "NAME"

    invoke-virtual {v1, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 503
    new-instance v2, Ljava/io/File;

    const-string v3, "FILE_PATH"

    invoke-virtual {v1, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {}, Lcom/zeapo/pwdstore/utils/PasswordRepository;->getWorkTree()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    const-string v5, ""

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    .line 506
    .local v0, cat:Ljava/lang/String;
    invoke-virtual {p0, v6}, Lcom/zeapo/pwdstore/crypto/PgpHandler;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 507
    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    invoke-virtual {p0, v2}, Lcom/zeapo/pwdstore/crypto/PgpHandler;->decryptAndVerify(Landroid/content/Intent;)V

    .line 526
    .end local v0           #cat:Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 508
    :cond_1
    const-string v2, "Operation"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "ENCRYPT"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 509
    iget-object v2, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler;->bindingDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v2}, Landroid/app/ProgressDialog;->dismiss()V

    .line 511
    const v2, 0x7f03001c

    invoke-virtual {p0, v2}, Lcom/zeapo/pwdstore/crypto/PgpHandler;->setContentView(I)V

    .line 512
    const-string v2, "FILE_PATH"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 513
    .restart local v0       #cat:Ljava/lang/String;
    invoke-static {}, Lcom/zeapo/pwdstore/utils/PasswordRepository;->getWorkTree()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 514
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 515
    invoke-virtual {p0, v6}, Lcom/zeapo/pwdstore/crypto/PgpHandler;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 516
    .end local v0           #cat:Ljava/lang/String;
    :cond_2
    const-string v2, "Operation"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "GET_KEY_ID"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 517
    iget-object v2, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler;->bindingDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v2}, Landroid/app/ProgressDialog;->dismiss()V

    .line 518
    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    invoke-virtual {p0, v2}, Lcom/zeapo/pwdstore/crypto/PgpHandler;->getKeyIds(Landroid/content/Intent;)V

    goto :goto_0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 8
    .parameter "savedInstanceState"

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 83
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 85
    iput-object p0, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler;->activity:Landroid/app/Activity;

    .line 86
    const-string v3, "clipboard"

    invoke-virtual {p0, v3}, Lcom/zeapo/pwdstore/crypto/PgpHandler;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/ClipboardManager;

    iput-object v3, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler;->clipboard:Landroid/content/ClipboardManager;

    .line 89
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v3

    iput-object v3, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler;->settings:Landroid/content/SharedPreferences;

    .line 90
    iget-object v3, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler;->settings:Landroid/content/SharedPreferences;

    const-string v4, "openpgp_provider_list"

    const-string v5, ""

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 91
    .local v2, providerPackageName:Ljava/lang/String;
    iget-object v3, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler;->settings:Landroid/content/SharedPreferences;

    const-string v4, "openpgp_account_name"

    const-string v5, ""

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler;->accountName:Ljava/lang/String;

    .line 92
    iget-object v3, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler;->settings:Landroid/content/SharedPreferences;

    const-string v4, "openpgp_key_ids"

    const-string v5, ""

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler;->keyIDs:Ljava/lang/String;

    .line 94
    iput-boolean v6, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler;->registered:Z

    .line 96
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 97
    const-string v3, "No OpenPGP Provider selected!"

    invoke-static {p0, v3, v7}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    .line 98
    new-instance v1, Landroid/content/Intent;

    const-class v3, Lcom/zeapo/pwdstore/UserPreference;

    invoke-direct {v1, p0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 99
    .local v1, intent:Landroid/content/Intent;
    invoke-virtual {p0, v1}, Lcom/zeapo/pwdstore/crypto/PgpHandler;->startActivity(Landroid/content/Intent;)V

    .line 101
    invoke-virtual {p0, v6}, Lcom/zeapo/pwdstore/crypto/PgpHandler;->setResult(I)V

    .line 102
    invoke-virtual {p0}, Lcom/zeapo/pwdstore/crypto/PgpHandler;->finish()V

    .line 121
    .end local v1           #intent:Landroid/content/Intent;
    :goto_0
    return-void

    .line 107
    :cond_0
    new-instance v3, Lorg/openintents/openpgp/util/OpenPgpServiceConnection;

    invoke-direct {v3, p0, v2, p0}, Lorg/openintents/openpgp/util/OpenPgpServiceConnection;-><init>(Landroid/content/Context;Ljava/lang/String;Lorg/openintents/openpgp/util/OpenPgpServiceConnection$OnBound;)V

    iput-object v3, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler;->mServiceConnection:Lorg/openintents/openpgp/util/OpenPgpServiceConnection;

    .line 109
    iget-object v3, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler;->mServiceConnection:Lorg/openintents/openpgp/util/OpenPgpServiceConnection;

    invoke-virtual {v3}, Lorg/openintents/openpgp/util/OpenPgpServiceConnection;->bindToService()V

    .line 111
    new-instance v3, Landroid/app/ProgressDialog;

    invoke-direct {v3, p0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object v3, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler;->bindingDialog:Landroid/app/ProgressDialog;

    .line 112
    iget-object v3, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler;->bindingDialog:Landroid/app/ProgressDialog;

    const-string v4, "Waiting for OpenKeychain..."

    invoke-virtual {v3, v4}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 113
    iget-object v3, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler;->bindingDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v3, v6}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 114
    iget-object v3, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler;->bindingDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v3}, Landroid/app/ProgressDialog;->show()V

    .line 116
    iput-boolean v7, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler;->registered:Z

    .line 118
    invoke-virtual {p0}, Lcom/zeapo/pwdstore/crypto/PgpHandler;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    .line 119
    .local v0, actionBar:Landroid/app/ActionBar;
    invoke-virtual {v0, v7}, Landroid/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    goto :goto_0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .parameter "menu"

    .prologue
    .line 137
    invoke-virtual {p0}, Lcom/zeapo/pwdstore/crypto/PgpHandler;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const v1, 0x7f0e0002

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 138
    const/4 v0, 0x1

    return v0
.end method

.method public onError(Ljava/lang/Exception;)V
    .locals 0
    .parameter "e"

    .prologue
    .line 531
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 4
    .parameter "item"

    .prologue
    .line 146
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    .line 147
    .local v1, id:I
    sparse-switch v1, :sswitch_data_0

    .line 156
    :goto_0
    invoke-super {p0, p1}, Landroid/app/Activity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v2

    :goto_1
    return v2

    .line 149
    :sswitch_0
    const/4 v2, -0x1

    invoke-virtual {p0, v2}, Lcom/zeapo/pwdstore/crypto/PgpHandler;->setResult(I)V

    .line 150
    invoke-virtual {p0}, Lcom/zeapo/pwdstore/crypto/PgpHandler;->finish()V

    .line 151
    const/4 v2, 0x1

    goto :goto_1

    .line 153
    :sswitch_1
    const-string v3, "pgp_handler_result_pm"

    const v2, 0x7f09004e

    invoke-virtual {p0, v2}, Lcom/zeapo/pwdstore/crypto/PgpHandler;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-static {v3, v2}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;

    move-result-object v0

    .line 154
    .local v0, clip:Landroid/content/ClipData;
    iget-object v2, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler;->clipboard:Landroid/content/ClipboardManager;

    invoke-virtual {v2, v0}, Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V

    goto :goto_0

    .line 147
    :sswitch_data_0
    .sparse-switch
        0x102002c -> :sswitch_0
        0x7f090074 -> :sswitch_1
    .end sparse-switch
.end method

.method public onStop()V
    .locals 1

    .prologue
    .line 125
    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    .line 126
    iget-boolean v0, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler;->registered:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler;->mServiceConnection:Lorg/openintents/openpgp/util/OpenPgpServiceConnection;

    invoke-virtual {v0}, Lorg/openintents/openpgp/util/OpenPgpServiceConnection;->isBound()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 128
    :try_start_0
    iget-object v0, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler;->mServiceConnection:Lorg/openintents/openpgp/util/OpenPgpServiceConnection;

    invoke-virtual {v0}, Lorg/openintents/openpgp/util/OpenPgpServiceConnection;->unbindFromService()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 132
    :cond_0
    :goto_0
    return-void

    .line 129
    :catch_0
    move-exception v0

    goto :goto_0
.end method

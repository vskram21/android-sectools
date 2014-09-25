.class public Lcom/zeapo/pwdstore/GitHandler;
.super Landroid/app/Activity;
.source "GitHandler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/zeapo/pwdstore/GitHandler$SshConfigSessionFactory;,
        Lcom/zeapo/pwdstore/GitHandler$GitConfigSessionFactory;
    }
.end annotation


# static fields
.field private static final GET_SSH_KEY_FROM_CLONE:I = 0xc9

.field public static final REQUEST_CLONE:I = 0x67

.field public static final REQUEST_INIT:I = 0x68

.field public static final REQUEST_PULL:I = 0x65

.field public static final REQUEST_PUSH:I = 0x66


# instance fields
.field private activity:Landroid/app/Activity;

.field private connectionMode:Ljava/lang/String;

.field private context:Landroid/content/Context;

.field private hostname:Ljava/lang/String;

.field private localDir:Ljava/io/File;

.field private protocol:Ljava/lang/String;

.field private settings:Landroid/content/SharedPreferences;

.field private username:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 52
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 215
    return-void
.end method

.method static synthetic access$000(Lcom/zeapo/pwdstore/GitHandler;)Ljava/lang/String;
    .locals 1
    .parameter "x0"

    .prologue
    .line 52
    iget-object v0, p0, Lcom/zeapo/pwdstore/GitHandler;->protocol:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$002(Lcom/zeapo/pwdstore/GitHandler;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 52
    iput-object p1, p0, Lcom/zeapo/pwdstore/GitHandler;->protocol:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$100(Lcom/zeapo/pwdstore/GitHandler;)Landroid/app/Activity;
    .locals 1
    .parameter "x0"

    .prologue
    .line 52
    iget-object v0, p0, Lcom/zeapo/pwdstore/GitHandler;->activity:Landroid/app/Activity;

    return-object v0
.end method

.method static synthetic access$202(Lcom/zeapo/pwdstore/GitHandler;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 52
    iput-object p1, p0, Lcom/zeapo/pwdstore/GitHandler;->connectionMode:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$300(Lcom/zeapo/pwdstore/GitHandler;)Landroid/content/SharedPreferences;
    .locals 1
    .parameter "x0"

    .prologue
    .line 52
    iget-object v0, p0, Lcom/zeapo/pwdstore/GitHandler;->settings:Landroid/content/SharedPreferences;

    return-object v0
.end method

.method static synthetic access$500(Lcom/zeapo/pwdstore/GitHandler;)Ljava/io/File;
    .locals 1
    .parameter "x0"

    .prologue
    .line 52
    iget-object v0, p0, Lcom/zeapo/pwdstore/GitHandler;->localDir:Ljava/io/File;

    return-object v0
.end method

.method static synthetic access$600(Lcom/zeapo/pwdstore/GitHandler;Ljava/lang/String;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 52
    invoke-direct {p0, p1}, Lcom/zeapo/pwdstore/GitHandler;->authenticateAndRun(Ljava/lang/String;)V

    return-void
.end method

.method private authenticateAndRun(Ljava/lang/String;)V
    .locals 5
    .parameter "operation"

    .prologue
    .line 464
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Class;

    const/4 v3, 0x0

    const-class v4, Lorg/eclipse/jgit/transport/UsernamePasswordCredentialsProvider;

    aput-object v4, v2, v3

    invoke-virtual {v1, p1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    invoke-direct {p0, p0, v1}, Lcom/zeapo/pwdstore/GitHandler;->invokeWithAuthentication(Lcom/zeapo/pwdstore/GitHandler;Ljava/lang/reflect/Method;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 468
    :goto_0
    return-void

    .line 465
    :catch_0
    move-exception v0

    .line 466
    .local v0, e:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method private invokeWithAuthentication(Lcom/zeapo/pwdstore/GitHandler;Ljava/lang/reflect/Method;)V
    .locals 9
    .parameter "activity"
    .parameter "method"

    .prologue
    const/16 v5, 0x81

    const/4 v4, -0x1

    .line 477
    iget-object v0, p0, Lcom/zeapo/pwdstore/GitHandler;->connectionMode:Ljava/lang/String;

    const-string v1, "ssh-key"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 478
    new-instance v2, Ljava/io/File;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/zeapo/pwdstore/GitHandler;->getFilesDir()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/.ssh_key"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 479
    .local v2, sshKey:Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_1

    .line 480
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v1, "Please import your SSH key file in the preferences"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "No SSH key"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "OK"

    new-instance v4, Lcom/zeapo/pwdstore/GitHandler$11;

    invoke-direct {v4, p0}, Lcom/zeapo/pwdstore/GitHandler$11;-><init>(Lcom/zeapo/pwdstore/GitHandler;)V

    invoke-virtual {v0, v1, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "Cancel"

    new-instance v4, Lcom/zeapo/pwdstore/GitHandler$10;

    invoke-direct {v4, p0}, Lcom/zeapo/pwdstore/GitHandler$10;-><init>(Lcom/zeapo/pwdstore/GitHandler;)V

    invoke-virtual {v0, v1, v4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 571
    .end local v2           #sshKey:Ljava/io/File;
    :cond_0
    :goto_0
    return-void

    .line 501
    .restart local v2       #sshKey:Ljava/io/File;
    :cond_1
    new-instance v3, Landroid/widget/EditText;

    invoke-direct {v3, p1}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 502
    .local v3, passphrase:Landroid/widget/EditText;
    const-string v0, "Passphrase"

    invoke-virtual {v3, v0}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 503
    invoke-virtual {v3, v4}, Landroid/widget/EditText;->setWidth(I)V

    .line 504
    invoke-virtual {v3, v5}, Landroid/widget/EditText;->setInputType(I)V

    .line 506
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v1, "Authenticate"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "Please provide the passphrase for your SSH key. Leave it empty if there is no passphrase."

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v7

    const-string v8, "OK"

    new-instance v0, Lcom/zeapo/pwdstore/GitHandler$13;

    move-object v1, p0

    move-object v4, p2

    move-object v5, p1

    invoke-direct/range {v0 .. v5}, Lcom/zeapo/pwdstore/GitHandler$13;-><init>(Lcom/zeapo/pwdstore/GitHandler;Ljava/io/File;Landroid/widget/EditText;Ljava/lang/reflect/Method;Lcom/zeapo/pwdstore/GitHandler;)V

    invoke-virtual {v7, v8, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "Cancel"

    new-instance v4, Lcom/zeapo/pwdstore/GitHandler$12;

    invoke-direct {v4, p0}, Lcom/zeapo/pwdstore/GitHandler$12;-><init>(Lcom/zeapo/pwdstore/GitHandler;)V

    invoke-virtual {v0, v1, v4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0

    .line 537
    .end local v2           #sshKey:Ljava/io/File;
    .end local v3           #passphrase:Landroid/widget/EditText;
    :cond_2
    iget-object v0, p0, Lcom/zeapo/pwdstore/GitHandler;->protocol:Ljava/lang/String;

    const-string v1, "ssh://"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 538
    new-instance v6, Landroid/widget/EditText;

    invoke-direct {v6, p1}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 539
    .local v6, password:Landroid/widget/EditText;
    const-string v0, "Password"

    invoke-virtual {v6, v0}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 540
    invoke-virtual {v6, v4}, Landroid/widget/EditText;->setWidth(I)V

    .line 541
    invoke-virtual {v6, v5}, Landroid/widget/EditText;->setInputType(I)V

    .line 543
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v1, "Authenticate"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "Please provide the password for this repository"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, v6}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "OK"

    new-instance v4, Lcom/zeapo/pwdstore/GitHandler$15;

    invoke-direct {v4, p0, p2, p1, v6}, Lcom/zeapo/pwdstore/GitHandler$15;-><init>(Lcom/zeapo/pwdstore/GitHandler;Ljava/lang/reflect/Method;Lcom/zeapo/pwdstore/GitHandler;Landroid/widget/EditText;)V

    invoke-virtual {v0, v1, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "Cancel"

    new-instance v4, Lcom/zeapo/pwdstore/GitHandler$14;

    invoke-direct {v4, p0}, Lcom/zeapo/pwdstore/GitHandler$14;-><init>(Lcom/zeapo/pwdstore/GitHandler;)V

    invoke-virtual {v0, v1, v4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto/16 :goto_0
.end method


# virtual methods
.method public cloneOperation(Lorg/eclipse/jgit/transport/UsernamePasswordCredentialsProvider;)V
    .locals 7
    .parameter "provider"

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 344
    iget-object v2, p0, Lcom/zeapo/pwdstore/GitHandler;->settings:Landroid/content/SharedPreferences;

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 346
    .local v1, editor:Landroid/content/SharedPreferences$Editor;
    const-string v2, "git_remote_server"

    iget-object v3, p0, Lcom/zeapo/pwdstore/GitHandler;->hostname:Ljava/lang/String;

    const-string v4, "@"

    invoke-virtual {v3, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    aget-object v3, v3, v5

    const-string v4, ":"

    invoke-virtual {v3, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    aget-object v3, v3, v6

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 347
    const-string v2, "git_remote_location"

    iget-object v3, p0, Lcom/zeapo/pwdstore/GitHandler;->hostname:Ljava/lang/String;

    const-string v4, "@"

    invoke-virtual {v3, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    aget-object v3, v3, v5

    const-string v4, ":"

    invoke-virtual {v3, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    aget-object v3, v3, v5

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 348
    const-string v2, "git_remote_username"

    iget-object v3, p0, Lcom/zeapo/pwdstore/GitHandler;->hostname:Ljava/lang/String;

    const-string v4, "@"

    invoke-virtual {v3, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    aget-object v3, v3, v6

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 349
    const-string v2, "git_remote_protocol"

    iget-object v3, p0, Lcom/zeapo/pwdstore/GitHandler;->protocol:Ljava/lang/String;

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 350
    const-string v2, "git_remote_auth"

    iget-object v3, p0, Lcom/zeapo/pwdstore/GitHandler;->connectionMode:Ljava/lang/String;

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 351
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 353
    invoke-static {}, Lorg/eclipse/jgit/api/Git;->cloneRepository()Lorg/eclipse/jgit/api/CloneCommand;

    move-result-object v2

    invoke-virtual {v2, p1}, Lorg/eclipse/jgit/api/CloneCommand;->setCredentialsProvider(Lorg/eclipse/jgit/transport/CredentialsProvider;)Lorg/eclipse/jgit/api/GitCommand;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/api/CloneCommand;

    invoke-virtual {v2, v5}, Lorg/eclipse/jgit/api/CloneCommand;->setCloneAllBranches(Z)Lorg/eclipse/jgit/api/CloneCommand;

    move-result-object v2

    iget-object v3, p0, Lcom/zeapo/pwdstore/GitHandler;->localDir:Ljava/io/File;

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/api/CloneCommand;->setDirectory(Ljava/io/File;)Lorg/eclipse/jgit/api/CloneCommand;

    move-result-object v2

    iget-object v3, p0, Lcom/zeapo/pwdstore/GitHandler;->hostname:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/api/CloneCommand;->setURI(Ljava/lang/String;)Lorg/eclipse/jgit/api/CloneCommand;

    move-result-object v0

    .line 359
    .local v0, cmd:Lorg/eclipse/jgit/api/CloneCommand;
    new-instance v2, Lcom/zeapo/pwdstore/GitAsyncTask;

    iget-object v3, p0, Lcom/zeapo/pwdstore/GitHandler;->activity:Landroid/app/Activity;

    const-class v4, Lorg/eclipse/jgit/api/CloneCommand;

    invoke-direct {v2, v3, v5, v6, v4}, Lcom/zeapo/pwdstore/GitAsyncTask;-><init>(Landroid/app/Activity;ZZLjava/lang/Class;)V

    new-array v3, v5, [Lorg/eclipse/jgit/api/GitCommand;

    aput-object v0, v3, v6

    invoke-virtual {v2, v3}, Lcom/zeapo/pwdstore/GitAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 360
    return-void
.end method

.method public cloneRepository(Landroid/view/View;)V
    .locals 6
    .parameter "view"

    .prologue
    const v5, 0x7f090043

    const/4 v4, 0x0

    .line 269
    new-instance v1, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/zeapo/pwdstore/GitHandler;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/store"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lcom/zeapo/pwdstore/GitHandler;->localDir:Ljava/io/File;

    .line 271
    invoke-virtual {p0, v5}, Lcom/zeapo/pwdstore/GitHandler;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/zeapo/pwdstore/GitHandler;->hostname:Ljava/lang/String;

    .line 273
    iget-object v1, p0, Lcom/zeapo/pwdstore/GitHandler;->hostname:Ljava/lang/String;

    const-string v2, "^.+://"

    const-string v3, ""

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/zeapo/pwdstore/GitHandler;->hostname:Ljava/lang/String;

    .line 274
    invoke-virtual {p0, v5}, Lcom/zeapo/pwdstore/GitHandler;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iget-object v2, p0, Lcom/zeapo/pwdstore/GitHandler;->hostname:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 278
    iget-object v1, p0, Lcom/zeapo/pwdstore/GitHandler;->protocol:Ljava/lang/String;

    const-string v2, "ssh://"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 279
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/zeapo/pwdstore/GitHandler;->protocol:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/zeapo/pwdstore/GitHandler;->hostname:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/zeapo/pwdstore/GitHandler;->hostname:Ljava/lang/String;

    .line 299
    :goto_0
    iget-object v1, p0, Lcom/zeapo/pwdstore/GitHandler;->localDir:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 300
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v2, 0x7f0c0019

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f0c0018

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1, v4}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f0c0017

    new-instance v3, Lcom/zeapo/pwdstore/GitHandler$5;

    invoke-direct {v3, p0}, Lcom/zeapo/pwdstore/GitHandler$5;-><init>(Lcom/zeapo/pwdstore/GitHandler;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f0c001a

    new-instance v3, Lcom/zeapo/pwdstore/GitHandler$4;

    invoke-direct {v3, p0}, Lcom/zeapo/pwdstore/GitHandler$4;-><init>(Lcom/zeapo/pwdstore/GitHandler;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 339
    :goto_1
    return-void

    .line 282
    :cond_0
    iget-object v1, p0, Lcom/zeapo/pwdstore/GitHandler;->hostname:Ljava/lang/String;

    const-string v2, "^.+@.+"

    invoke-virtual {v1, v2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 283
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v2, "Did you forget to specify a username?"

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "Oups..."

    new-instance v3, Lcom/zeapo/pwdstore/GitHandler$3;

    invoke-direct {v3, p0}, Lcom/zeapo/pwdstore/GitHandler$3;-><init>(Lcom/zeapo/pwdstore/GitHandler;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_1

    .line 295
    :cond_1
    iget-object v1, p0, Lcom/zeapo/pwdstore/GitHandler;->hostname:Ljava/lang/String;

    const-string v2, "@"

    invoke-virtual {v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    aget-object v1, v1, v4

    iput-object v1, p0, Lcom/zeapo/pwdstore/GitHandler;->username:Ljava/lang/String;

    goto :goto_0

    .line 332
    :cond_2
    :try_start_0
    const-string v1, "cloneOperation"

    invoke-direct {p0, v1}, Lcom/zeapo/pwdstore/GitHandler;->authenticateAndRun(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 333
    :catch_0
    move-exception v0

    .line 336
    .local v0, e:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 1
    .parameter "requestCode"
    .parameter "resultCode"
    .parameter "data"

    .prologue
    .line 575
    if-nez p2, :cond_1

    .line 576
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/zeapo/pwdstore/GitHandler;->setResult(I)V

    .line 577
    invoke-virtual {p0}, Lcom/zeapo/pwdstore/GitHandler;->finish()V

    .line 595
    :cond_0
    :goto_0
    return-void

    .line 581
    :cond_1
    const/4 v0, -0x1

    if-ne p2, v0, :cond_0

    .line 583
    sparse-switch p1, :sswitch_data_0

    goto :goto_0

    .line 585
    :sswitch_0
    const-string v0, "pullOperation"

    invoke-direct {p0, v0}, Lcom/zeapo/pwdstore/GitHandler;->authenticateAndRun(Ljava/lang/String;)V

    goto :goto_0

    .line 588
    :sswitch_1
    const-string v0, "pushOperation"

    invoke-direct {p0, v0}, Lcom/zeapo/pwdstore/GitHandler;->authenticateAndRun(Ljava/lang/String;)V

    goto :goto_0

    .line 591
    :sswitch_2
    const-string v0, "cloneOperation"

    invoke-direct {p0, v0}, Lcom/zeapo/pwdstore/GitHandler;->authenticateAndRun(Ljava/lang/String;)V

    goto :goto_0

    .line 583
    nop

    :sswitch_data_0
    .sparse-switch
        0x65 -> :sswitch_0
        0x66 -> :sswitch_1
        0xc9 -> :sswitch_2
    .end sparse-switch
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 9
    .parameter "savedInstanceState"

    .prologue
    const v8, 0x1090009

    const v7, 0x1090008

    .line 75
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 77
    invoke-virtual {p0}, Lcom/zeapo/pwdstore/GitHandler;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    iput-object v4, p0, Lcom/zeapo/pwdstore/GitHandler;->context:Landroid/content/Context;

    .line 78
    iput-object p0, p0, Lcom/zeapo/pwdstore/GitHandler;->activity:Landroid/app/Activity;

    .line 80
    iget-object v4, p0, Lcom/zeapo/pwdstore/GitHandler;->context:Landroid/content/Context;

    invoke-static {v4}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v4

    iput-object v4, p0, Lcom/zeapo/pwdstore/GitHandler;->settings:Landroid/content/SharedPreferences;

    .line 82
    iget-object v4, p0, Lcom/zeapo/pwdstore/GitHandler;->settings:Landroid/content/SharedPreferences;

    const-string v5, "git_remote_protocol"

    const-string v6, "ssh://"

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/zeapo/pwdstore/GitHandler;->protocol:Ljava/lang/String;

    .line 83
    iget-object v4, p0, Lcom/zeapo/pwdstore/GitHandler;->settings:Landroid/content/SharedPreferences;

    const-string v5, "git_remote_auth"

    const-string v6, "username/password"

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/zeapo/pwdstore/GitHandler;->connectionMode:Ljava/lang/String;

    .line 85
    invoke-virtual {p0}, Lcom/zeapo/pwdstore/GitHandler;->getIntent()Landroid/content/Intent;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v4

    const-string v5, "Operation"

    invoke-virtual {v4, v5}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v4

    packed-switch v4, :pswitch_data_0

    .line 153
    :goto_0
    return-void

    .line 87
    :pswitch_0
    const v4, 0x7f030017

    invoke-virtual {p0, v4}, Lcom/zeapo/pwdstore/GitHandler;->setContentView(I)V

    .line 90
    const v4, 0x7f090042

    invoke-virtual {p0, v4}, Lcom/zeapo/pwdstore/GitHandler;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Spinner;

    .line 91
    .local v2, protcol_spinner:Landroid/widget/Spinner;
    const/high16 v4, 0x7f06

    invoke-static {p0, v4, v7}, Landroid/widget/ArrayAdapter;->createFromResource(Landroid/content/Context;II)Landroid/widget/ArrayAdapter;

    move-result-object v3

    .line 93
    .local v3, protocol_adapter:Landroid/widget/ArrayAdapter;,"Landroid/widget/ArrayAdapter<Ljava/lang/CharSequence;>;"
    invoke-virtual {v3, v8}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    .line 94
    invoke-virtual {v2, v3}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 95
    new-instance v4, Lcom/zeapo/pwdstore/GitHandler$1;

    invoke-direct {v4, p0}, Lcom/zeapo/pwdstore/GitHandler$1;-><init>(Lcom/zeapo/pwdstore/GitHandler;)V

    invoke-virtual {v2, v4}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 124
    const v4, 0x7f090044

    invoke-virtual {p0, v4}, Lcom/zeapo/pwdstore/GitHandler;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Spinner;

    .line 125
    .local v1, connection_mode_spinner:Landroid/widget/Spinner;
    const v4, 0x7f060001

    invoke-static {p0, v4, v7}, Landroid/widget/ArrayAdapter;->createFromResource(Landroid/content/Context;II)Landroid/widget/ArrayAdapter;

    move-result-object v0

    .line 127
    .local v0, connection_mode_adapter:Landroid/widget/ArrayAdapter;,"Landroid/widget/ArrayAdapter<Ljava/lang/CharSequence;>;"
    invoke-virtual {v0, v8}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    .line 128
    invoke-virtual {v1, v0}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 129
    new-instance v4, Lcom/zeapo/pwdstore/GitHandler$2;

    invoke-direct {v4, p0}, Lcom/zeapo/pwdstore/GitHandler$2;-><init>(Lcom/zeapo/pwdstore/GitHandler;)V

    invoke-virtual {v1, v4}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    goto :goto_0

    .line 144
    .end local v0           #connection_mode_adapter:Landroid/widget/ArrayAdapter;,"Landroid/widget/ArrayAdapter<Ljava/lang/CharSequence;>;"
    .end local v1           #connection_mode_spinner:Landroid/widget/Spinner;
    .end local v2           #protcol_spinner:Landroid/widget/Spinner;
    .end local v3           #protocol_adapter:Landroid/widget/ArrayAdapter;,"Landroid/widget/ArrayAdapter<Ljava/lang/CharSequence;>;"
    :pswitch_1
    const-string v4, "pullOperation"

    invoke-direct {p0, v4}, Lcom/zeapo/pwdstore/GitHandler;->authenticateAndRun(Ljava/lang/String;)V

    goto :goto_0

    .line 148
    :pswitch_2
    const-string v4, "pushOperation"

    invoke-direct {p0, v4}, Lcom/zeapo/pwdstore/GitHandler;->authenticateAndRun(Ljava/lang/String;)V

    goto :goto_0

    .line 85
    nop

    :pswitch_data_0
    .packed-switch 0x65
        :pswitch_1
        :pswitch_2
        :pswitch_0
    .end packed-switch
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .parameter "menu"

    .prologue
    .line 175
    invoke-virtual {p0}, Lcom/zeapo/pwdstore/GitHandler;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const v1, 0x7f0e0001

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 176
    const/4 v0, 0x1

    return v0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 5
    .parameter "item"

    .prologue
    .line 184
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    .line 185
    .local v1, id:I
    packed-switch v1, :pswitch_data_0

    .line 197
    invoke-super {p0, p1}, Landroid/app/Activity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v3

    :goto_0
    return v3

    .line 188
    :pswitch_0
    :try_start_0
    new-instance v2, Landroid/content/Intent;

    const-class v3, Lcom/zeapo/pwdstore/UserPreference;

    invoke-direct {v2, p0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 189
    .local v2, intent:Landroid/content/Intent;
    invoke-virtual {p0, v2}, Lcom/zeapo/pwdstore/GitHandler;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 194
    .end local v2           #intent:Landroid/content/Intent;
    :goto_1
    const/4 v3, 0x1

    goto :goto_0

    .line 190
    :catch_0
    move-exception v0

    .line 191
    .local v0, e:Ljava/lang/Exception;
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v4, "Exception caught :("

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 192
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    .line 185
    :pswitch_data_0
    .packed-switch 0x7f090073
        :pswitch_0
    .end packed-switch
.end method

.method public onResume()V
    .locals 6

    .prologue
    .line 157
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 159
    const v2, 0x7f090043

    invoke-virtual {p0, v2}, Lcom/zeapo/pwdstore/GitHandler;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    .line 160
    .local v1, uri:Landroid/widget/EditText;
    if-eqz v1, :cond_0

    .line 161
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/zeapo/pwdstore/GitHandler;->settings:Landroid/content/SharedPreferences;

    const-string v4, "git_remote_username"

    const-string v5, ""

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "@"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/zeapo/pwdstore/GitHandler;->settings:Landroid/content/SharedPreferences;

    const-string v4, "git_remote_server"

    const-string v5, ""

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ":"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/zeapo/pwdstore/GitHandler;->settings:Landroid/content/SharedPreferences;

    const-string v4, "git_remote_location"

    const-string v5, ""

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 168
    .local v0, hostname:Ljava/lang/String;
    const-string v2, "@:"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {v1, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 170
    .end local v0           #hostname:Ljava/lang/String;
    :cond_0
    return-void
.end method

.method public pullOperation(Lorg/eclipse/jgit/transport/UsernamePasswordCredentialsProvider;)V
    .locals 8
    .parameter "provider"

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 364
    iget-object v1, p0, Lcom/zeapo/pwdstore/GitHandler;->settings:Landroid/content/SharedPreferences;

    const-string v2, "git_remote_username"

    const-string v3, ""

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/zeapo/pwdstore/GitHandler;->settings:Landroid/content/SharedPreferences;

    const-string v2, "git_remote_server"

    const-string v3, ""

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/zeapo/pwdstore/GitHandler;->settings:Landroid/content/SharedPreferences;

    const-string v2, "git_remote_location"

    const-string v3, ""

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 367
    :cond_0
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v2, "You have to set the information about the server before synchronizing with the server"

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "On my way!"

    new-instance v3, Lcom/zeapo/pwdstore/GitHandler$7;

    invoke-direct {v3, p0}, Lcom/zeapo/pwdstore/GitHandler$7;-><init>(Lcom/zeapo/pwdstore/GitHandler;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "Nah... later"

    new-instance v3, Lcom/zeapo/pwdstore/GitHandler$6;

    invoke-direct {v3, p0}, Lcom/zeapo/pwdstore/GitHandler$6;-><init>(Lcom/zeapo/pwdstore/GitHandler;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 409
    :goto_0
    return-void

    .line 388
    :cond_1
    const-string v1, "origin"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/zeapo/pwdstore/GitHandler;->settings:Landroid/content/SharedPreferences;

    const-string v4, "git_remote_username"

    const-string v5, "user"

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "@"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/zeapo/pwdstore/GitHandler;->settings:Landroid/content/SharedPreferences;

    const-string v4, "git_remote_server"

    const-string v5, "server.com"

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ":"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/zeapo/pwdstore/GitHandler;->settings:Landroid/content/SharedPreferences;

    const-string v4, "git_remote_location"

    const-string v5, "path/to/repository"

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/zeapo/pwdstore/utils/PasswordRepository;->addRemote(Ljava/lang/String;Ljava/lang/String;)V

    .line 395
    if-eqz p1, :cond_2

    .line 396
    new-instance v1, Lorg/eclipse/jgit/api/Git;

    new-instance v2, Ljava/io/File;

    const-string v3, ""

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v2}, Lcom/zeapo/pwdstore/utils/PasswordRepository;->getRepository(Ljava/io/File;)Lorg/eclipse/jgit/lib/Repository;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/eclipse/jgit/api/Git;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    invoke-virtual {v1}, Lorg/eclipse/jgit/api/Git;->pull()Lorg/eclipse/jgit/api/PullCommand;

    move-result-object v1

    invoke-virtual {v1, v6}, Lorg/eclipse/jgit/api/PullCommand;->setRebase(Z)Lorg/eclipse/jgit/api/PullCommand;

    move-result-object v1

    const-string v2, "origin"

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/api/PullCommand;->setRemote(Ljava/lang/String;)Lorg/eclipse/jgit/api/PullCommand;

    move-result-object v1

    invoke-virtual {v1, p1}, Lorg/eclipse/jgit/api/PullCommand;->setCredentialsProvider(Lorg/eclipse/jgit/transport/CredentialsProvider;)Lorg/eclipse/jgit/api/GitCommand;

    move-result-object v0

    .line 407
    .local v0, cmd:Lorg/eclipse/jgit/api/GitCommand;
    :goto_1
    new-instance v1, Lcom/zeapo/pwdstore/GitAsyncTask;

    iget-object v2, p0, Lcom/zeapo/pwdstore/GitHandler;->activity:Landroid/app/Activity;

    const-class v3, Lorg/eclipse/jgit/api/PullCommand;

    invoke-direct {v1, v2, v6, v7, v3}, Lcom/zeapo/pwdstore/GitAsyncTask;-><init>(Landroid/app/Activity;ZZLjava/lang/Class;)V

    new-array v2, v6, [Lorg/eclipse/jgit/api/GitCommand;

    aput-object v0, v2, v7

    invoke-virtual {v1, v2}, Lcom/zeapo/pwdstore/GitAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_0

    .line 402
    .end local v0           #cmd:Lorg/eclipse/jgit/api/GitCommand;
    :cond_2
    new-instance v1, Lorg/eclipse/jgit/api/Git;

    new-instance v2, Ljava/io/File;

    const-string v3, ""

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v2}, Lcom/zeapo/pwdstore/utils/PasswordRepository;->getRepository(Ljava/io/File;)Lorg/eclipse/jgit/lib/Repository;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/eclipse/jgit/api/Git;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    invoke-virtual {v1}, Lorg/eclipse/jgit/api/Git;->pull()Lorg/eclipse/jgit/api/PullCommand;

    move-result-object v1

    invoke-virtual {v1, v6}, Lorg/eclipse/jgit/api/PullCommand;->setRebase(Z)Lorg/eclipse/jgit/api/PullCommand;

    move-result-object v1

    const-string v2, "origin"

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/api/PullCommand;->setRemote(Ljava/lang/String;)Lorg/eclipse/jgit/api/PullCommand;

    move-result-object v0

    .restart local v0       #cmd:Lorg/eclipse/jgit/api/GitCommand;
    goto :goto_1
.end method

.method public pushOperation(Lorg/eclipse/jgit/transport/UsernamePasswordCredentialsProvider;)V
    .locals 8
    .parameter "provider"

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 413
    iget-object v1, p0, Lcom/zeapo/pwdstore/GitHandler;->settings:Landroid/content/SharedPreferences;

    const-string v2, "git_remote_username"

    const-string v3, "user"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/zeapo/pwdstore/GitHandler;->settings:Landroid/content/SharedPreferences;

    const-string v2, "git_remote_server"

    const-string v3, "server.com"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/zeapo/pwdstore/GitHandler;->settings:Landroid/content/SharedPreferences;

    const-string v2, "git_remote_location"

    const-string v3, "path/to/repository"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 416
    :cond_0
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v2, "You have to set the information about the server before synchronizing with the server"

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "On my way!"

    new-instance v3, Lcom/zeapo/pwdstore/GitHandler$9;

    invoke-direct {v3, p0}, Lcom/zeapo/pwdstore/GitHandler$9;-><init>(Lcom/zeapo/pwdstore/GitHandler;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "Nah... later"

    new-instance v3, Lcom/zeapo/pwdstore/GitHandler$8;

    invoke-direct {v3, p0}, Lcom/zeapo/pwdstore/GitHandler$8;-><init>(Lcom/zeapo/pwdstore/GitHandler;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 459
    :goto_0
    return-void

    .line 437
    :cond_1
    const-string v1, "origin"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/zeapo/pwdstore/GitHandler;->settings:Landroid/content/SharedPreferences;

    const-string v4, "git_remote_username"

    const-string v5, "user"

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "@"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/zeapo/pwdstore/GitHandler;->settings:Landroid/content/SharedPreferences;

    const-string v4, "git_remote_server"

    const-string v5, "server.com"

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ":"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/zeapo/pwdstore/GitHandler;->settings:Landroid/content/SharedPreferences;

    const-string v4, "git_remote_location"

    const-string v5, "path/to/repository"

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/zeapo/pwdstore/utils/PasswordRepository;->addRemote(Ljava/lang/String;Ljava/lang/String;)V

    .line 444
    if-eqz p1, :cond_2

    .line 445
    new-instance v1, Lorg/eclipse/jgit/api/Git;

    new-instance v2, Ljava/io/File;

    const-string v3, ""

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v2}, Lcom/zeapo/pwdstore/utils/PasswordRepository;->getRepository(Ljava/io/File;)Lorg/eclipse/jgit/lib/Repository;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/eclipse/jgit/api/Git;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    invoke-virtual {v1}, Lorg/eclipse/jgit/api/Git;->push()Lorg/eclipse/jgit/api/PushCommand;

    move-result-object v1

    invoke-virtual {v1}, Lorg/eclipse/jgit/api/PushCommand;->setPushAll()Lorg/eclipse/jgit/api/PushCommand;

    move-result-object v1

    const-string v2, "origin"

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/api/PushCommand;->setRemote(Ljava/lang/String;)Lorg/eclipse/jgit/api/PushCommand;

    move-result-object v1

    invoke-virtual {v1, p1}, Lorg/eclipse/jgit/api/PushCommand;->setCredentialsProvider(Lorg/eclipse/jgit/transport/CredentialsProvider;)Lorg/eclipse/jgit/api/GitCommand;

    move-result-object v0

    .line 457
    .local v0, cmd:Lorg/eclipse/jgit/api/GitCommand;
    :goto_1
    new-instance v1, Lcom/zeapo/pwdstore/GitAsyncTask;

    iget-object v2, p0, Lcom/zeapo/pwdstore/GitHandler;->activity:Landroid/app/Activity;

    const-class v3, Lorg/eclipse/jgit/api/PushCommand;

    invoke-direct {v1, v2, v7, v6, v3}, Lcom/zeapo/pwdstore/GitAsyncTask;-><init>(Landroid/app/Activity;ZZLjava/lang/Class;)V

    new-array v2, v7, [Lorg/eclipse/jgit/api/GitCommand;

    aput-object v0, v2, v6

    invoke-virtual {v1, v2}, Lcom/zeapo/pwdstore/GitAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_0

    .line 451
    .end local v0           #cmd:Lorg/eclipse/jgit/api/GitCommand;
    :cond_2
    new-instance v1, Lorg/eclipse/jgit/api/Git;

    new-instance v2, Ljava/io/File;

    const-string v3, ""

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v2}, Lcom/zeapo/pwdstore/utils/PasswordRepository;->getRepository(Ljava/io/File;)Lorg/eclipse/jgit/lib/Repository;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/eclipse/jgit/api/Git;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    invoke-virtual {v1}, Lorg/eclipse/jgit/api/Git;->push()Lorg/eclipse/jgit/api/PushCommand;

    move-result-object v1

    invoke-virtual {v1}, Lorg/eclipse/jgit/api/PushCommand;->setPushAll()Lorg/eclipse/jgit/api/PushCommand;

    move-result-object v1

    const-string v2, "origin"

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/api/PushCommand;->setRemote(Ljava/lang/String;)Lorg/eclipse/jgit/api/PushCommand;

    move-result-object v0

    .restart local v0       #cmd:Lorg/eclipse/jgit/api/GitCommand;
    goto :goto_1
.end method

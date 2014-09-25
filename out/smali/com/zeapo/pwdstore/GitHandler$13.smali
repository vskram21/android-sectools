.class Lcom/zeapo/pwdstore/GitHandler$13;
.super Ljava/lang/Object;
.source "GitHandler.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zeapo/pwdstore/GitHandler;->invokeWithAuthentication(Lcom/zeapo/pwdstore/GitHandler;Ljava/lang/reflect/Method;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/zeapo/pwdstore/GitHandler;

.field final synthetic val$activity:Lcom/zeapo/pwdstore/GitHandler;

.field final synthetic val$method:Ljava/lang/reflect/Method;

.field final synthetic val$passphrase:Landroid/widget/EditText;

.field final synthetic val$sshKey:Ljava/io/File;


# direct methods
.method constructor <init>(Lcom/zeapo/pwdstore/GitHandler;Ljava/io/File;Landroid/widget/EditText;Ljava/lang/reflect/Method;Lcom/zeapo/pwdstore/GitHandler;)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 510
    iput-object p1, p0, Lcom/zeapo/pwdstore/GitHandler$13;->this$0:Lcom/zeapo/pwdstore/GitHandler;

    iput-object p2, p0, Lcom/zeapo/pwdstore/GitHandler$13;->val$sshKey:Ljava/io/File;

    iput-object p3, p0, Lcom/zeapo/pwdstore/GitHandler$13;->val$passphrase:Landroid/widget/EditText;

    iput-object p4, p0, Lcom/zeapo/pwdstore/GitHandler$13;->val$method:Ljava/lang/reflect/Method;

    iput-object p5, p0, Lcom/zeapo/pwdstore/GitHandler$13;->val$activity:Lcom/zeapo/pwdstore/GitHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 7
    .parameter "dialog"
    .parameter "whichButton"

    .prologue
    .line 513
    new-instance v2, Lcom/zeapo/pwdstore/GitHandler$GitConfigSessionFactory;

    iget-object v3, p0, Lcom/zeapo/pwdstore/GitHandler$13;->this$0:Lcom/zeapo/pwdstore/GitHandler;

    invoke-direct {v2, v3}, Lcom/zeapo/pwdstore/GitHandler$GitConfigSessionFactory;-><init>(Lcom/zeapo/pwdstore/GitHandler;)V

    invoke-static {v2}, Lorg/eclipse/jgit/transport/SshSessionFactory;->setInstance(Lorg/eclipse/jgit/transport/SshSessionFactory;)V

    .line 516
    :try_start_0
    new-instance v1, Lcom/zeapo/pwdstore/GitHandler$SshConfigSessionFactory;

    iget-object v2, p0, Lcom/zeapo/pwdstore/GitHandler$13;->this$0:Lcom/zeapo/pwdstore/GitHandler;

    iget-object v3, p0, Lcom/zeapo/pwdstore/GitHandler$13;->val$sshKey:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/zeapo/pwdstore/GitHandler$13;->val$passphrase:Landroid/widget/EditText;

    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v2, v3, v4}, Lcom/zeapo/pwdstore/GitHandler$SshConfigSessionFactory;-><init>(Lcom/zeapo/pwdstore/GitHandler;Ljava/lang/String;Ljava/lang/String;)V

    .line 517
    .local v1, sessionFactory:Lorg/eclipse/jgit/transport/JschConfigSessionFactory;
    invoke-static {v1}, Lorg/eclipse/jgit/transport/SshSessionFactory;->setInstance(Lorg/eclipse/jgit/transport/SshSessionFactory;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 520
    :try_start_1
    iget-object v3, p0, Lcom/zeapo/pwdstore/GitHandler$13;->val$method:Ljava/lang/reflect/Method;

    iget-object v4, p0, Lcom/zeapo/pwdstore/GitHandler$13;->val$activity:Lcom/zeapo/pwdstore/GitHandler;

    const/4 v2, 0x1

    new-array v5, v2, [Ljava/lang/Object;

    const/4 v6, 0x0

    const/4 v2, 0x0

    check-cast v2, Lorg/eclipse/jgit/transport/UsernamePasswordCredentialsProvider;

    aput-object v2, v5, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 529
    .end local v1           #sessionFactory:Lorg/eclipse/jgit/transport/JschConfigSessionFactory;
    :goto_0
    return-void

    .line 521
    .restart local v1       #sessionFactory:Lorg/eclipse/jgit/transport/JschConfigSessionFactory;
    :catch_0
    move-exception v0

    .line 522
    .local v0, e:Ljava/lang/Exception;
    :try_start_2
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 525
    .end local v0           #e:Ljava/lang/Exception;
    .end local v1           #sessionFactory:Lorg/eclipse/jgit/transport/JschConfigSessionFactory;
    :catch_1
    move-exception v0

    .line 526
    .restart local v0       #e:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

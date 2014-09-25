.class Lcom/zeapo/pwdstore/GitHandler$15;
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

.field final synthetic val$password:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/zeapo/pwdstore/GitHandler;Ljava/lang/reflect/Method;Lcom/zeapo/pwdstore/GitHandler;Landroid/widget/EditText;)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 547
    iput-object p1, p0, Lcom/zeapo/pwdstore/GitHandler$15;->this$0:Lcom/zeapo/pwdstore/GitHandler;

    iput-object p2, p0, Lcom/zeapo/pwdstore/GitHandler$15;->val$method:Ljava/lang/reflect/Method;

    iput-object p3, p0, Lcom/zeapo/pwdstore/GitHandler$15;->val$activity:Lcom/zeapo/pwdstore/GitHandler;

    iput-object p4, p0, Lcom/zeapo/pwdstore/GitHandler$15;->val$password:Landroid/widget/EditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 9
    .parameter "dialog"
    .parameter "whichButton"

    .prologue
    .line 550
    new-instance v1, Lcom/zeapo/pwdstore/GitHandler$GitConfigSessionFactory;

    iget-object v2, p0, Lcom/zeapo/pwdstore/GitHandler$15;->this$0:Lcom/zeapo/pwdstore/GitHandler;

    invoke-direct {v1, v2}, Lcom/zeapo/pwdstore/GitHandler$GitConfigSessionFactory;-><init>(Lcom/zeapo/pwdstore/GitHandler;)V

    invoke-static {v1}, Lorg/eclipse/jgit/transport/SshSessionFactory;->setInstance(Lorg/eclipse/jgit/transport/SshSessionFactory;)V

    .line 552
    :try_start_0
    iget-object v1, p0, Lcom/zeapo/pwdstore/GitHandler$15;->val$method:Ljava/lang/reflect/Method;

    iget-object v2, p0, Lcom/zeapo/pwdstore/GitHandler$15;->val$activity:Lcom/zeapo/pwdstore/GitHandler;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    new-instance v5, Lorg/eclipse/jgit/transport/UsernamePasswordCredentialsProvider;

    iget-object v6, p0, Lcom/zeapo/pwdstore/GitHandler$15;->this$0:Lcom/zeapo/pwdstore/GitHandler;

    #getter for: Lcom/zeapo/pwdstore/GitHandler;->settings:Landroid/content/SharedPreferences;
    invoke-static {v6}, Lcom/zeapo/pwdstore/GitHandler;->access$300(Lcom/zeapo/pwdstore/GitHandler;)Landroid/content/SharedPreferences;

    move-result-object v6

    const-string v7, "git_remote_username"

    const-string v8, "git"

    invoke-interface {v6, v7, v8}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lcom/zeapo/pwdstore/GitHandler$15;->val$password:Landroid/widget/EditText;

    invoke-virtual {v7}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Lorg/eclipse/jgit/transport/UsernamePasswordCredentialsProvider;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 561
    :goto_0
    return-void

    .line 557
    :catch_0
    move-exception v0

    .line 558
    .local v0, e:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

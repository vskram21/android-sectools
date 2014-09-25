.class Lcom/zeapo/pwdstore/PasswordStore$6;
.super Ljava/lang/Object;
.source "PasswordStore.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zeapo/pwdstore/PasswordStore;->deletePassword(Lcom/zeapo/pwdstore/utils/PasswordItem;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/zeapo/pwdstore/PasswordStore;

.field final synthetic val$item:Lcom/zeapo/pwdstore/utils/PasswordItem;


# direct methods
.method constructor <init>(Lcom/zeapo/pwdstore/PasswordStore;Lcom/zeapo/pwdstore/utils/PasswordItem;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 320
    iput-object p1, p0, Lcom/zeapo/pwdstore/PasswordStore$6;->this$0:Lcom/zeapo/pwdstore/PasswordStore;

    iput-object p2, p0, Lcom/zeapo/pwdstore/PasswordStore$6;->val$item:Lcom/zeapo/pwdstore/utils/PasswordItem;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 9
    .parameter "dialogInterface"
    .parameter "i"

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 323
    iget-object v3, p0, Lcom/zeapo/pwdstore/PasswordStore$6;->val$item:Lcom/zeapo/pwdstore/utils/PasswordItem;

    invoke-virtual {v3}, Lcom/zeapo/pwdstore/utils/PasswordItem;->getFile()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    .line 324
    .local v1, path:Ljava/lang/String;
    iget-object v3, p0, Lcom/zeapo/pwdstore/PasswordStore$6;->val$item:Lcom/zeapo/pwdstore/utils/PasswordItem;

    invoke-virtual {v3}, Lcom/zeapo/pwdstore/utils/PasswordItem;->getFile()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    .line 326
    iget-object v3, p0, Lcom/zeapo/pwdstore/PasswordStore$6;->this$0:Lcom/zeapo/pwdstore/PasswordStore;

    invoke-virtual {v3, v7}, Lcom/zeapo/pwdstore/PasswordStore;->setResult(I)V

    .line 327
    new-instance v0, Lorg/eclipse/jgit/api/Git;

    new-instance v3, Ljava/io/File;

    const-string v4, ""

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v3}, Lcom/zeapo/pwdstore/utils/PasswordRepository;->getRepository(Ljava/io/File;)Lorg/eclipse/jgit/lib/Repository;

    move-result-object v3

    invoke-direct {v0, v3}, Lorg/eclipse/jgit/api/Git;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 328
    .local v0, git:Lorg/eclipse/jgit/api/Git;
    new-instance v2, Lcom/zeapo/pwdstore/GitAsyncTask;

    iget-object v3, p0, Lcom/zeapo/pwdstore/PasswordStore$6;->this$0:Lcom/zeapo/pwdstore/PasswordStore;

    #getter for: Lcom/zeapo/pwdstore/PasswordStore;->activity:Landroid/app/Activity;
    invoke-static {v3}, Lcom/zeapo/pwdstore/PasswordStore;->access$000(Lcom/zeapo/pwdstore/PasswordStore;)Landroid/app/Activity;

    move-result-object v3

    const-class v4, Lorg/eclipse/jgit/api/CommitCommand;

    invoke-direct {v2, v3, v7, v8, v4}, Lcom/zeapo/pwdstore/GitAsyncTask;-><init>(Landroid/app/Activity;ZZLjava/lang/Class;)V

    .line 329
    .local v2, tasks:Lcom/zeapo/pwdstore/GitAsyncTask;
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v3, v2}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    .line 330
    const/4 v3, 0x2

    new-array v3, v3, [Lorg/eclipse/jgit/api/GitCommand;

    invoke-virtual {v0}, Lorg/eclipse/jgit/api/Git;->rm()Lorg/eclipse/jgit/api/RmCommand;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/zeapo/pwdstore/utils/PasswordRepository;->getWorkTree()Ljava/io/File;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v6, ""

    invoke-virtual {v1, v5, v6}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/api/RmCommand;->addFilepattern(Ljava/lang/String;)Lorg/eclipse/jgit/api/RmCommand;

    move-result-object v4

    aput-object v4, v3, v7

    invoke-virtual {v0}, Lorg/eclipse/jgit/api/Git;->commit()Lorg/eclipse/jgit/api/CommitCommand;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "[ANDROID PwdStore] Remove "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/zeapo/pwdstore/PasswordStore$6;->val$item:Lcom/zeapo/pwdstore/utils/PasswordItem;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " from store."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/api/CommitCommand;->setMessage(Ljava/lang/String;)Lorg/eclipse/jgit/api/CommitCommand;

    move-result-object v4

    aput-object v4, v3, v8

    invoke-virtual {v2, v3}, Lcom/zeapo/pwdstore/GitAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 334
    return-void
.end method

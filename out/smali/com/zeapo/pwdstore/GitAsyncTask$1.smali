.class Lcom/zeapo/pwdstore/GitAsyncTask$1;
.super Ljava/lang/Object;
.source "GitAsyncTask.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zeapo/pwdstore/GitAsyncTask;->onPostExecute(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/zeapo/pwdstore/GitAsyncTask;


# direct methods
.method constructor <init>(Lcom/zeapo/pwdstore/GitAsyncTask;)V
    .locals 0
    .parameter

    .prologue
    .line 64
    iput-object p1, p0, Lcom/zeapo/pwdstore/GitAsyncTask$1;->this$0:Lcom/zeapo/pwdstore/GitAsyncTask;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .parameter "dialogInterface"
    .parameter "i"

    .prologue
    .line 67
    iget-object v1, p0, Lcom/zeapo/pwdstore/GitAsyncTask$1;->this$0:Lcom/zeapo/pwdstore/GitAsyncTask;

    #getter for: Lcom/zeapo/pwdstore/GitAsyncTask;->operation:Ljava/lang/Class;
    invoke-static {v1}, Lcom/zeapo/pwdstore/GitAsyncTask;->access$000(Lcom/zeapo/pwdstore/GitAsyncTask;)Ljava/lang/Class;

    move-result-object v1

    const-class v2, Lorg/eclipse/jgit/api/CloneCommand;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 70
    :try_start_0
    invoke-static {}, Lcom/zeapo/pwdstore/utils/PasswordRepository;->getWorkTree()Ljava/io/File;

    move-result-object v1

    invoke-static {v1}, Lorg/apache/commons/io/FileUtils;->deleteDirectory(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 78
    :goto_0
    return-void

    .line 71
    :catch_0
    move-exception v0

    .line 72
    .local v0, e:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 75
    .end local v0           #e:Ljava/lang/Exception;
    :cond_0
    iget-object v1, p0, Lcom/zeapo/pwdstore/GitAsyncTask$1;->this$0:Lcom/zeapo/pwdstore/GitAsyncTask;

    #getter for: Lcom/zeapo/pwdstore/GitAsyncTask;->activity:Landroid/app/Activity;
    invoke-static {v1}, Lcom/zeapo/pwdstore/GitAsyncTask;->access$100(Lcom/zeapo/pwdstore/GitAsyncTask;)Landroid/app/Activity;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/app/Activity;->setResult(I)V

    .line 76
    iget-object v1, p0, Lcom/zeapo/pwdstore/GitAsyncTask$1;->this$0:Lcom/zeapo/pwdstore/GitAsyncTask;

    #getter for: Lcom/zeapo/pwdstore/GitAsyncTask;->activity:Landroid/app/Activity;
    invoke-static {v1}, Lcom/zeapo/pwdstore/GitAsyncTask;->access$100(Lcom/zeapo/pwdstore/GitAsyncTask;)Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->finish()V

    goto :goto_0
.end method

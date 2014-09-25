.class public Lcom/zeapo/pwdstore/GitAsyncTask;
.super Landroid/os/AsyncTask;
.source "GitAsyncTask.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Lorg/eclipse/jgit/api/GitCommand;",
        "Ljava/lang/Integer;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field private activity:Landroid/app/Activity;

.field private dialog:Landroid/app/ProgressDialog;

.field private finishOnEnd:Z

.field private operation:Ljava/lang/Class;

.field private refreshListOnEnd:Z


# direct methods
.method public constructor <init>(Landroid/app/Activity;ZZLjava/lang/Class;)V
    .locals 2
    .parameter "activity"
    .parameter "finishOnEnd"
    .parameter "refreshListOnEnd"
    .parameter "operation"

    .prologue
    .line 28
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 29
    iput-object p1, p0, Lcom/zeapo/pwdstore/GitAsyncTask;->activity:Landroid/app/Activity;

    .line 30
    iput-boolean p2, p0, Lcom/zeapo/pwdstore/GitAsyncTask;->finishOnEnd:Z

    .line 31
    iput-boolean p3, p0, Lcom/zeapo/pwdstore/GitAsyncTask;->refreshListOnEnd:Z

    .line 32
    iput-object p4, p0, Lcom/zeapo/pwdstore/GitAsyncTask;->operation:Ljava/lang/Class;

    .line 34
    new-instance v0, Landroid/app/ProgressDialog;

    iget-object v1, p0, Lcom/zeapo/pwdstore/GitAsyncTask;->activity:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/zeapo/pwdstore/GitAsyncTask;->dialog:Landroid/app/ProgressDialog;

    .line 35
    return-void
.end method

.method static synthetic access$000(Lcom/zeapo/pwdstore/GitAsyncTask;)Ljava/lang/Class;
    .locals 1
    .parameter "x0"

    .prologue
    .line 21
    iget-object v0, p0, Lcom/zeapo/pwdstore/GitAsyncTask;->operation:Ljava/lang/Class;

    return-object v0
.end method

.method static synthetic access$100(Lcom/zeapo/pwdstore/GitAsyncTask;)Landroid/app/Activity;
    .locals 1
    .parameter "x0"

    .prologue
    .line 21
    iget-object v0, p0, Lcom/zeapo/pwdstore/GitAsyncTask;->activity:Landroid/app/Activity;

    return-object v0
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 21
    check-cast p1, [Lorg/eclipse/jgit/api/GitCommand;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/zeapo/pwdstore/GitAsyncTask;->doInBackground([Lorg/eclipse/jgit/api/GitCommand;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Lorg/eclipse/jgit/api/GitCommand;)Ljava/lang/String;
    .locals 4
    .parameter "cmd"

    .prologue
    .line 45
    array-length v0, p1

    .line 46
    .local v0, count:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    if-ge v2, v0, :cond_0

    .line 48
    :try_start_0
    aget-object v3, p1, v2

    invoke-virtual {v3}, Lorg/eclipse/jgit/api/GitCommand;->call()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 46
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 49
    :catch_0
    move-exception v1

    .line 50
    .local v1, e:Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 51
    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    .line 54
    .end local v1           #e:Ljava/lang/Exception;
    :goto_1
    return-object v3

    :cond_0
    const-string v3, ""

    goto :goto_1
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 21
    check-cast p1, Ljava/lang/String;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/zeapo/pwdstore/GitAsyncTask;->onPostExecute(Ljava/lang/String;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/String;)V
    .locals 3
    .parameter "result"

    .prologue
    .line 58
    iget-object v0, p0, Lcom/zeapo/pwdstore/GitAsyncTask;->dialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 60
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 61
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/zeapo/pwdstore/GitAsyncTask;->activity:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v1, "Internal exception occurred"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Message from jgit:\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "OK"

    new-instance v2, Lcom/zeapo/pwdstore/GitAsyncTask$1;

    invoke-direct {v2, p0}, Lcom/zeapo/pwdstore/GitAsyncTask$1;-><init>(Lcom/zeapo/pwdstore/GitAsyncTask;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 95
    :cond_0
    :goto_0
    return-void

    .line 82
    :cond_1
    iget-boolean v0, p0, Lcom/zeapo/pwdstore/GitAsyncTask;->finishOnEnd:Z

    if-eqz v0, :cond_2

    .line 83
    iget-object v0, p0, Lcom/zeapo/pwdstore/GitAsyncTask;->activity:Landroid/app/Activity;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/app/Activity;->setResult(I)V

    .line 84
    iget-object v0, p0, Lcom/zeapo/pwdstore/GitAsyncTask;->activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 87
    :cond_2
    iget-boolean v0, p0, Lcom/zeapo/pwdstore/GitAsyncTask;->refreshListOnEnd:Z

    if-eqz v0, :cond_0

    .line 89
    :try_start_0
    iget-object v0, p0, Lcom/zeapo/pwdstore/GitAsyncTask;->activity:Landroid/app/Activity;

    check-cast v0, Lcom/zeapo/pwdstore/PasswordStore;

    invoke-virtual {v0}, Lcom/zeapo/pwdstore/PasswordStore;->refreshListAdapter()V
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 90
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method protected onPreExecute()V
    .locals 2

    .prologue
    .line 38
    iget-object v0, p0, Lcom/zeapo/pwdstore/GitAsyncTask;->dialog:Landroid/app/ProgressDialog;

    const-string v1, "Running command..."

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 39
    iget-object v0, p0, Lcom/zeapo/pwdstore/GitAsyncTask;->dialog:Landroid/app/ProgressDialog;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 40
    iget-object v0, p0, Lcom/zeapo/pwdstore/GitAsyncTask;->dialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    .line 41
    return-void
.end method

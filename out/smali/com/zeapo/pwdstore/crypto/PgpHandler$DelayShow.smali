.class public Lcom/zeapo/pwdstore/crypto/PgpHandler$DelayShow;
.super Landroid/os/AsyncTask;
.source "PgpHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zeapo/pwdstore/crypto/PgpHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "DelayShow"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Integer;",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field final SHOW_TIME:I

.field count:I

.field pb:Landroid/widget/ProgressBar;

.field final synthetic this$0:Lcom/zeapo/pwdstore/crypto/PgpHandler;


# direct methods
.method public constructor <init>(Lcom/zeapo/pwdstore/crypto/PgpHandler;)V
    .locals 1
    .parameter

    .prologue
    .line 208
    iput-object p1, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler$DelayShow;->this$0:Lcom/zeapo/pwdstore/crypto/PgpHandler;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 209
    const/4 v0, 0x0

    iput v0, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler$DelayShow;->count:I

    .line 210
    const/16 v0, 0xa

    iput v0, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler$DelayShow;->SHOW_TIME:I

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Boolean;
    .locals 4
    .parameter "params"

    .prologue
    const/4 v3, 0x1

    .line 229
    :goto_0
    iget v0, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler$DelayShow;->count:I

    const/16 v1, 0xa

    if-ge v0, v1, :cond_0

    .line 230
    const-wide/16 v0, 0x3e8

    invoke-static {v0, v1}, Landroid/os/SystemClock;->sleep(J)V

    .line 231
    iget v0, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler$DelayShow;->count:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler$DelayShow;->count:I

    .line 232
    new-array v0, v3, [Ljava/lang/Integer;

    const/4 v1, 0x0

    iget v2, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler$DelayShow;->count:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    invoke-virtual {p0, v0}, Lcom/zeapo/pwdstore/crypto/PgpHandler$DelayShow;->publishProgress([Ljava/lang/Object;)V

    goto :goto_0

    .line 234
    :cond_0
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 208
    check-cast p1, [Ljava/lang/Void;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/zeapo/pwdstore/crypto/PgpHandler$DelayShow;->doInBackground([Ljava/lang/Void;)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Ljava/lang/Boolean;)V
    .locals 4
    .parameter "b"

    .prologue
    const/4 v3, 0x4

    .line 240
    const-string v1, "pgp_handler_result_pm"

    const-string v2, "MyPasswordIsDaBest!"

    invoke-static {v1, v2}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;

    move-result-object v0

    .line 241
    .local v0, clip:Landroid/content/ClipData;
    iget-object v1, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler$DelayShow;->this$0:Lcom/zeapo/pwdstore/crypto/PgpHandler;

    iget-object v1, v1, Lcom/zeapo/pwdstore/crypto/PgpHandler;->clipboard:Landroid/content/ClipboardManager;

    invoke-virtual {v1, v0}, Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V

    .line 244
    iget-object v1, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler$DelayShow;->this$0:Lcom/zeapo/pwdstore/crypto/PgpHandler;

    const v2, 0x7f09004e

    invoke-virtual {v1, v2}, Lcom/zeapo/pwdstore/crypto/PgpHandler;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    const-string v2, ""

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 245
    iget-object v1, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler$DelayShow;->this$0:Lcom/zeapo/pwdstore/crypto/PgpHandler;

    const v2, 0x7f090051

    invoke-virtual {v1, v2}, Lcom/zeapo/pwdstore/crypto/PgpHandler;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    const-string v2, ""

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 246
    iget-object v1, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler$DelayShow;->this$0:Lcom/zeapo/pwdstore/crypto/PgpHandler;

    const v2, 0x7f090050

    invoke-virtual {v1, v2}, Lcom/zeapo/pwdstore/crypto/PgpHandler;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 247
    iget-object v1, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler$DelayShow;->this$0:Lcom/zeapo/pwdstore/crypto/PgpHandler;

    const v2, 0x7f090048

    invoke-virtual {v1, v2}, Lcom/zeapo/pwdstore/crypto/PgpHandler;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 248
    iget-object v1, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler$DelayShow;->this$0:Lcom/zeapo/pwdstore/crypto/PgpHandler;

    #getter for: Lcom/zeapo/pwdstore/crypto/PgpHandler;->activity:Landroid/app/Activity;
    invoke-static {v1}, Lcom/zeapo/pwdstore/crypto/PgpHandler;->access$000(Lcom/zeapo/pwdstore/crypto/PgpHandler;)Landroid/app/Activity;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/app/Activity;->setResult(I)V

    .line 249
    iget-object v1, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler$DelayShow;->this$0:Lcom/zeapo/pwdstore/crypto/PgpHandler;

    #getter for: Lcom/zeapo/pwdstore/crypto/PgpHandler;->activity:Landroid/app/Activity;
    invoke-static {v1}, Lcom/zeapo/pwdstore/crypto/PgpHandler;->access$000(Lcom/zeapo/pwdstore/crypto/PgpHandler;)Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->finish()V

    .line 250
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 208
    check-cast p1, Ljava/lang/Boolean;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/zeapo/pwdstore/crypto/PgpHandler$DelayShow;->onPostExecute(Ljava/lang/Boolean;)V

    return-void
.end method

.method protected onPreExecute()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 215
    iget-object v2, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler$DelayShow;->this$0:Lcom/zeapo/pwdstore/crypto/PgpHandler;

    const v3, 0x7f090048

    invoke-virtual {v2, v3}, Lcom/zeapo/pwdstore/crypto/PgpHandler;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 216
    .local v0, container:Landroid/widget/LinearLayout;
    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 218
    iget-object v2, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler$DelayShow;->this$0:Lcom/zeapo/pwdstore/crypto/PgpHandler;

    const v3, 0x7f090051

    invoke-virtual {v2, v3}, Lcom/zeapo/pwdstore/crypto/PgpHandler;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 220
    .local v1, extraText:Landroid/widget/TextView;
    invoke-virtual {v1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/CharSequence;->length()I

    move-result v2

    if-eqz v2, :cond_0

    .line 221
    iget-object v2, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler$DelayShow;->this$0:Lcom/zeapo/pwdstore/crypto/PgpHandler;

    const v3, 0x7f090050

    invoke-virtual {v2, v3}, Lcom/zeapo/pwdstore/crypto/PgpHandler;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout;

    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 223
    :cond_0
    iget-object v2, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler$DelayShow;->this$0:Lcom/zeapo/pwdstore/crypto/PgpHandler;

    const v3, 0x7f09004f

    invoke-virtual {v2, v3}, Lcom/zeapo/pwdstore/crypto/PgpHandler;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ProgressBar;

    iput-object v2, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler$DelayShow;->pb:Landroid/widget/ProgressBar;

    .line 224
    iget-object v2, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler$DelayShow;->pb:Landroid/widget/ProgressBar;

    const/16 v3, 0xa

    invoke-virtual {v2, v3}, Landroid/widget/ProgressBar;->setMax(I)V

    .line 225
    return-void
.end method

.method protected varargs onProgressUpdate([Ljava/lang/Integer;)V
    .locals 2
    .parameter "values"

    .prologue
    .line 255
    iget-object v0, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler$DelayShow;->pb:Landroid/widget/ProgressBar;

    const/4 v1, 0x0

    aget-object v1, p1, v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 256
    return-void
.end method

.method protected bridge synthetic onProgressUpdate([Ljava/lang/Object;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 208
    check-cast p1, [Ljava/lang/Integer;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/zeapo/pwdstore/crypto/PgpHandler$DelayShow;->onProgressUpdate([Ljava/lang/Integer;)V

    return-void
.end method

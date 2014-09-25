.class Lcom/zeapo/pwdstore/GitHandler$5;
.super Ljava/lang/Object;
.source "GitHandler.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zeapo/pwdstore/GitHandler;->cloneRepository(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/zeapo/pwdstore/GitHandler;


# direct methods
.method constructor <init>(Lcom/zeapo/pwdstore/GitHandler;)V
    .locals 0
    .parameter

    .prologue
    .line 305
    iput-object p1, p0, Lcom/zeapo/pwdstore/GitHandler$5;->this$0:Lcom/zeapo/pwdstore/GitHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .parameter "dialog"
    .parameter "id"

    .prologue
    .line 308
    :try_start_0
    iget-object v1, p0, Lcom/zeapo/pwdstore/GitHandler$5;->this$0:Lcom/zeapo/pwdstore/GitHandler;

    #getter for: Lcom/zeapo/pwdstore/GitHandler;->localDir:Ljava/io/File;
    invoke-static {v1}, Lcom/zeapo/pwdstore/GitHandler;->access$500(Lcom/zeapo/pwdstore/GitHandler;)Ljava/io/File;

    move-result-object v1

    invoke-static {v1}, Lorg/apache/commons/io/FileUtils;->deleteDirectory(Ljava/io/File;)V

    .line 309
    iget-object v1, p0, Lcom/zeapo/pwdstore/GitHandler$5;->this$0:Lcom/zeapo/pwdstore/GitHandler;

    const-string v2, "cloneOperation"

    #calls: Lcom/zeapo/pwdstore/GitHandler;->authenticateAndRun(Ljava/lang/String;)V
    invoke-static {v1, v2}, Lcom/zeapo/pwdstore/GitHandler;->access$600(Lcom/zeapo/pwdstore/GitHandler;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 318
    :goto_0
    invoke-interface {p1}, Landroid/content/DialogInterface;->cancel()V

    .line 319
    return-void

    .line 310
    :catch_0
    move-exception v0

    .line 312
    .local v0, e:Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    .line 313
    .end local v0           #e:Ljava/io/IOException;
    :catch_1
    move-exception v1

    goto :goto_0
.end method

.class Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$2;
.super Ljava/lang/Object;
.source "DfsReader.java"

# interfaces
.implements Lorg/eclipse/jgit/lib/AsyncObjectLoaderQueue;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->open(Ljava/lang/Iterable;Z)Lorg/eclipse/jgit/lib/AsyncObjectLoaderQueue;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lorg/eclipse/jgit/lib/AsyncObjectLoaderQueue",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private cur:Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$FoundObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$FoundObject",
            "<TT;>;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;

.field final synthetic val$findAllError:Ljava/io/IOException;

.field final synthetic val$idItr:Ljava/util/Iterator;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;Ljava/util/Iterator;Ljava/io/IOException;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 324
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$2;->this$0:Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;

    iput-object p2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$2;->val$idItr:Ljava/util/Iterator;

    iput-object p3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$2;->val$findAllError:Ljava/io/IOException;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public cancel(Z)Z
    .locals 1
    .parameter "mayInterruptIfRunning"

    .prologue
    .line 353
    const/4 v0, 0x1

    return v0
.end method

.method public getCurrent()Lorg/eclipse/jgit/lib/ObjectId;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 339
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$2;->cur:Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$FoundObject;

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$FoundObject;->id:Lorg/eclipse/jgit/lib/ObjectId;

    return-object v0
.end method

.method public getObjectId()Lorg/eclipse/jgit/lib/ObjectId;
    .locals 1

    .prologue
    .line 343
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$2;->cur:Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$FoundObject;

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$FoundObject;->id:Lorg/eclipse/jgit/lib/ObjectId;

    return-object v0
.end method

.method public next()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 328
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$2;->val$idItr:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 329
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$2;->val$idItr:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$FoundObject;

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$2;->cur:Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$FoundObject;

    .line 330
    const/4 v0, 0x1

    .line 334
    :goto_0
    return v0

    .line 331
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$2;->val$findAllError:Ljava/io/IOException;

    if-eqz v0, :cond_1

    .line 332
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$2;->val$findAllError:Ljava/io/IOException;

    throw v0

    .line 334
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public open()Lorg/eclipse/jgit/lib/ObjectLoader;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 347
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$2;->cur:Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$FoundObject;

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$FoundObject;->pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    if-nez v0, :cond_0

    .line 348
    new-instance v0, Lorg/eclipse/jgit/errors/MissingObjectException;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$2;->cur:Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$FoundObject;

    iget-object v1, v1, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$FoundObject;->id:Lorg/eclipse/jgit/lib/ObjectId;

    const-string v2, "unknown"

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/errors/MissingObjectException;-><init>(Lorg/eclipse/jgit/lib/ObjectId;Ljava/lang/String;)V

    throw v0

    .line 349
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$2;->cur:Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$FoundObject;

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$FoundObject;->pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$2;->this$0:Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$2;->cur:Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$FoundObject;

    iget-wide v2, v2, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$FoundObject;->offset:J

    invoke-virtual {v0, v1, v2, v3}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->load(Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;J)Lorg/eclipse/jgit/lib/ObjectLoader;

    move-result-object v0

    return-object v0
.end method

.method public release()V
    .locals 0

    .prologue
    .line 358
    return-void
.end method

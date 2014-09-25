.class Lorg/eclipse/jgit/lib/ObjectReader$1;
.super Ljava/lang/Object;
.source "ObjectReader.java"

# interfaces
.implements Lorg/eclipse/jgit/lib/AsyncObjectLoaderQueue;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/lib/ObjectReader;->open(Ljava/lang/Iterable;Z)Lorg/eclipse/jgit/lib/AsyncObjectLoaderQueue;
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
.field private cur:Lorg/eclipse/jgit/lib/ObjectId;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lorg/eclipse/jgit/lib/ObjectReader;

.field final synthetic val$idItr:Ljava/util/Iterator;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/lib/ObjectReader;Ljava/util/Iterator;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 281
    iput-object p1, p0, Lorg/eclipse/jgit/lib/ObjectReader$1;->this$0:Lorg/eclipse/jgit/lib/ObjectReader;

    iput-object p2, p0, Lorg/eclipse/jgit/lib/ObjectReader$1;->val$idItr:Ljava/util/Iterator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public cancel(Z)Z
    .locals 1
    .parameter "mayInterruptIfRunning"

    .prologue
    .line 306
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
    .line 294
    iget-object v0, p0, Lorg/eclipse/jgit/lib/ObjectReader$1;->cur:Lorg/eclipse/jgit/lib/ObjectId;

    return-object v0
.end method

.method public getObjectId()Lorg/eclipse/jgit/lib/ObjectId;
    .locals 1

    .prologue
    .line 298
    iget-object v0, p0, Lorg/eclipse/jgit/lib/ObjectReader$1;->cur:Lorg/eclipse/jgit/lib/ObjectId;

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
    .line 285
    iget-object v0, p0, Lorg/eclipse/jgit/lib/ObjectReader$1;->val$idItr:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 286
    iget-object v0, p0, Lorg/eclipse/jgit/lib/ObjectReader$1;->val$idItr:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/lib/ObjectId;

    iput-object v0, p0, Lorg/eclipse/jgit/lib/ObjectReader$1;->cur:Lorg/eclipse/jgit/lib/ObjectId;

    .line 287
    const/4 v0, 0x1

    .line 289
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public open()Lorg/eclipse/jgit/lib/ObjectLoader;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 302
    iget-object v0, p0, Lorg/eclipse/jgit/lib/ObjectReader$1;->this$0:Lorg/eclipse/jgit/lib/ObjectReader;

    iget-object v1, p0, Lorg/eclipse/jgit/lib/ObjectReader$1;->cur:Lorg/eclipse/jgit/lib/ObjectId;

    const/4 v2, -0x1

    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jgit/lib/ObjectReader;->open(Lorg/eclipse/jgit/lib/AnyObjectId;I)Lorg/eclipse/jgit/lib/ObjectLoader;

    move-result-object v0

    return-object v0
.end method

.method public release()V
    .locals 0

    .prologue
    .line 312
    return-void
.end method

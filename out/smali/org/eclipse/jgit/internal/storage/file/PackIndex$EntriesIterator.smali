.class abstract Lorg/eclipse/jgit/internal/storage/file/PackIndex$EntriesIterator;
.super Ljava/lang/Object;
.source "PackIndex.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/internal/storage/file/PackIndex;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x400
    name = "EntriesIterator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator",
        "<",
        "Lorg/eclipse/jgit/internal/storage/file/PackIndex$MutableEntry;",
        ">;"
    }
.end annotation


# instance fields
.field protected final entry:Lorg/eclipse/jgit/internal/storage/file/PackIndex$MutableEntry;

.field protected returnedNumber:J

.field final synthetic this$0:Lorg/eclipse/jgit/internal/storage/file/PackIndex;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/internal/storage/file/PackIndex;)V
    .locals 2
    .parameter

    .prologue
    .line 355
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndex$EntriesIterator;->this$0:Lorg/eclipse/jgit/internal/storage/file/PackIndex;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 356
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/PackIndex$EntriesIterator;->initEntry()Lorg/eclipse/jgit/internal/storage/file/PackIndex$MutableEntry;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndex$EntriesIterator;->entry:Lorg/eclipse/jgit/internal/storage/file/PackIndex$MutableEntry;

    .line 358
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndex$EntriesIterator;->returnedNumber:J

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 4

    .prologue
    .line 363
    iget-wide v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndex$EntriesIterator;->returnedNumber:J

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndex$EntriesIterator;->this$0:Lorg/eclipse/jgit/internal/storage/file/PackIndex;

    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/file/PackIndex;->getObjectCount()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected abstract initEntry()Lorg/eclipse/jgit/internal/storage/file/PackIndex$MutableEntry;
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 355
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/PackIndex$EntriesIterator;->next()Lorg/eclipse/jgit/internal/storage/file/PackIndex$MutableEntry;

    move-result-object v0

    return-object v0
.end method

.method public abstract next()Lorg/eclipse/jgit/internal/storage/file/PackIndex$MutableEntry;
.end method

.method public remove()V
    .locals 1

    .prologue
    .line 373
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

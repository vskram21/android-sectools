.class Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult$1;
.super Ljava/lang/Object;
.source "PackWriterBitmapPreparer.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult;->iterator()Ljava/util/Iterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator",
        "<",
        "Lorg/eclipse/jgit/revwalk/RevCommit;",
        ">;"
    }
.end annotation


# instance fields
.field pos:I

.field final synthetic this$0:Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult;)V
    .locals 1
    .parameter

    .prologue
    .line 356
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult$1;->this$0:Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 357
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult$1;->this$0:Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult;

    #getter for: Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult;->commitStartPos:I
    invoke-static {v0}, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult;->access$100(Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult;)I

    move-result v0

    iput v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult$1;->pos:I

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 2

    .prologue
    .line 360
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult$1;->pos:I

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult$1;->this$0:Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult;

    #getter for: Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult;->commitsByOldest:[Lorg/eclipse/jgit/revwalk/RevCommit;
    invoke-static {v1}, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult;->access$000(Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult;)[Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v1

    array-length v1, v1

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 356
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult$1;->next()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v0

    return-object v0
.end method

.method public next()Lorg/eclipse/jgit/revwalk/RevCommit;
    .locals 3

    .prologue
    .line 364
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult$1;->this$0:Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult;

    #getter for: Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult;->commitsByOldest:[Lorg/eclipse/jgit/revwalk/RevCommit;
    invoke-static {v0}, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult;->access$000(Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult;)[Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v0

    iget v1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult$1;->pos:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult$1;->pos:I

    aget-object v0, v0, v1

    return-object v0
.end method

.method public remove()V
    .locals 1

    .prologue
    .line 368
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

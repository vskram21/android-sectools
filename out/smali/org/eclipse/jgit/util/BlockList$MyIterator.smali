.class Lorg/eclipse/jgit/util/BlockList$MyIterator;
.super Ljava/lang/Object;
.source "BlockList.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/util/BlockList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MyIterator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private blkIdx:I

.field private block:[Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[TT;"
        }
    .end annotation
.end field

.field private dirIdx:I

.field private index:I

.field final synthetic this$0:Lorg/eclipse/jgit/util/BlockList;


# direct methods
.method private constructor <init>(Lorg/eclipse/jgit/util/BlockList;)V
    .locals 2
    .parameter

    .prologue
    .line 303
    .local p0, this:Lorg/eclipse/jgit/util/BlockList$MyIterator;,"Lorg/eclipse/jgit/util/BlockList<TT;>.MyIterator;"
    iput-object p1, p0, Lorg/eclipse/jgit/util/BlockList$MyIterator;->this$0:Lorg/eclipse/jgit/util/BlockList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 310
    iget-object v0, p0, Lorg/eclipse/jgit/util/BlockList$MyIterator;->this$0:Lorg/eclipse/jgit/util/BlockList;

    #getter for: Lorg/eclipse/jgit/util/BlockList;->directory:[[Ljava/lang/Object;
    invoke-static {v0}, Lorg/eclipse/jgit/util/BlockList;->access$100(Lorg/eclipse/jgit/util/BlockList;)[[Ljava/lang/Object;

    move-result-object v0

    const/4 v1, 0x0

    aget-object v0, v0, v1

    iput-object v0, p0, Lorg/eclipse/jgit/util/BlockList$MyIterator;->block:[Ljava/lang/Object;

    return-void
.end method

.method synthetic constructor <init>(Lorg/eclipse/jgit/util/BlockList;Lorg/eclipse/jgit/util/BlockList$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 303
    .local p0, this:Lorg/eclipse/jgit/util/BlockList$MyIterator;,"Lorg/eclipse/jgit/util/BlockList<TT;>.MyIterator;"
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/util/BlockList$MyIterator;-><init>(Lorg/eclipse/jgit/util/BlockList;)V

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 2

    .prologue
    .line 313
    .local p0, this:Lorg/eclipse/jgit/util/BlockList$MyIterator;,"Lorg/eclipse/jgit/util/BlockList<TT;>.MyIterator;"
    iget v0, p0, Lorg/eclipse/jgit/util/BlockList$MyIterator;->index:I

    iget-object v1, p0, Lorg/eclipse/jgit/util/BlockList$MyIterator;->this$0:Lorg/eclipse/jgit/util/BlockList;

    #getter for: Lorg/eclipse/jgit/util/BlockList;->size:I
    invoke-static {v1}, Lorg/eclipse/jgit/util/BlockList;->access$200(Lorg/eclipse/jgit/util/BlockList;)I

    move-result v1

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public next()Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 317
    .local p0, this:Lorg/eclipse/jgit/util/BlockList$MyIterator;,"Lorg/eclipse/jgit/util/BlockList<TT;>.MyIterator;"
    iget-object v1, p0, Lorg/eclipse/jgit/util/BlockList$MyIterator;->this$0:Lorg/eclipse/jgit/util/BlockList;

    #getter for: Lorg/eclipse/jgit/util/BlockList;->size:I
    invoke-static {v1}, Lorg/eclipse/jgit/util/BlockList;->access$200(Lorg/eclipse/jgit/util/BlockList;)I

    move-result v1

    iget v2, p0, Lorg/eclipse/jgit/util/BlockList$MyIterator;->index:I

    if-gt v1, v2, :cond_0

    .line 318
    new-instance v1, Ljava/util/NoSuchElementException;

    invoke-direct {v1}, Ljava/util/NoSuchElementException;-><init>()V

    throw v1

    .line 320
    :cond_0
    iget-object v1, p0, Lorg/eclipse/jgit/util/BlockList$MyIterator;->block:[Ljava/lang/Object;

    iget v2, p0, Lorg/eclipse/jgit/util/BlockList$MyIterator;->blkIdx:I

    aget-object v0, v1, v2

    .line 321
    .local v0, res:Ljava/lang/Object;,"TT;"
    iget v1, p0, Lorg/eclipse/jgit/util/BlockList$MyIterator;->blkIdx:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/eclipse/jgit/util/BlockList$MyIterator;->blkIdx:I

    const/16 v2, 0x400

    if-ne v1, v2, :cond_1

    .line 322
    iget v1, p0, Lorg/eclipse/jgit/util/BlockList$MyIterator;->dirIdx:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/eclipse/jgit/util/BlockList$MyIterator;->dirIdx:I

    iget-object v2, p0, Lorg/eclipse/jgit/util/BlockList$MyIterator;->this$0:Lorg/eclipse/jgit/util/BlockList;

    #getter for: Lorg/eclipse/jgit/util/BlockList;->directory:[[Ljava/lang/Object;
    invoke-static {v2}, Lorg/eclipse/jgit/util/BlockList;->access$100(Lorg/eclipse/jgit/util/BlockList;)[[Ljava/lang/Object;

    move-result-object v2

    array-length v2, v2

    if-ge v1, v2, :cond_2

    .line 323
    iget-object v1, p0, Lorg/eclipse/jgit/util/BlockList$MyIterator;->this$0:Lorg/eclipse/jgit/util/BlockList;

    #getter for: Lorg/eclipse/jgit/util/BlockList;->directory:[[Ljava/lang/Object;
    invoke-static {v1}, Lorg/eclipse/jgit/util/BlockList;->access$100(Lorg/eclipse/jgit/util/BlockList;)[[Ljava/lang/Object;

    move-result-object v1

    iget v2, p0, Lorg/eclipse/jgit/util/BlockList$MyIterator;->dirIdx:I

    aget-object v1, v1, v2

    iput-object v1, p0, Lorg/eclipse/jgit/util/BlockList$MyIterator;->block:[Ljava/lang/Object;

    .line 326
    :goto_0
    const/4 v1, 0x0

    iput v1, p0, Lorg/eclipse/jgit/util/BlockList$MyIterator;->blkIdx:I

    .line 328
    :cond_1
    iget v1, p0, Lorg/eclipse/jgit/util/BlockList$MyIterator;->index:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/eclipse/jgit/util/BlockList$MyIterator;->index:I

    .line 329
    return-object v0

    .line 325
    :cond_2
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/eclipse/jgit/util/BlockList$MyIterator;->block:[Ljava/lang/Object;

    goto :goto_0
.end method

.method public remove()V
    .locals 2

    .prologue
    .line 333
    .local p0, this:Lorg/eclipse/jgit/util/BlockList$MyIterator;,"Lorg/eclipse/jgit/util/BlockList<TT;>.MyIterator;"
    iget v0, p0, Lorg/eclipse/jgit/util/BlockList$MyIterator;->index:I

    if-nez v0, :cond_0

    .line 334
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 336
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/util/BlockList$MyIterator;->this$0:Lorg/eclipse/jgit/util/BlockList;

    iget v1, p0, Lorg/eclipse/jgit/util/BlockList$MyIterator;->index:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lorg/eclipse/jgit/util/BlockList$MyIterator;->index:I

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/util/BlockList;->remove(I)Ljava/lang/Object;

    .line 338
    iget v0, p0, Lorg/eclipse/jgit/util/BlockList$MyIterator;->index:I

    #calls: Lorg/eclipse/jgit/util/BlockList;->toDirectoryIndex(I)I
    invoke-static {v0}, Lorg/eclipse/jgit/util/BlockList;->access$300(I)I

    move-result v0

    iput v0, p0, Lorg/eclipse/jgit/util/BlockList$MyIterator;->dirIdx:I

    .line 339
    iget v0, p0, Lorg/eclipse/jgit/util/BlockList$MyIterator;->index:I

    #calls: Lorg/eclipse/jgit/util/BlockList;->toBlockIndex(I)I
    invoke-static {v0}, Lorg/eclipse/jgit/util/BlockList;->access$400(I)I

    move-result v0

    iput v0, p0, Lorg/eclipse/jgit/util/BlockList$MyIterator;->blkIdx:I

    .line 340
    iget-object v0, p0, Lorg/eclipse/jgit/util/BlockList$MyIterator;->this$0:Lorg/eclipse/jgit/util/BlockList;

    #getter for: Lorg/eclipse/jgit/util/BlockList;->directory:[[Ljava/lang/Object;
    invoke-static {v0}, Lorg/eclipse/jgit/util/BlockList;->access$100(Lorg/eclipse/jgit/util/BlockList;)[[Ljava/lang/Object;

    move-result-object v0

    iget v1, p0, Lorg/eclipse/jgit/util/BlockList$MyIterator;->dirIdx:I

    aget-object v0, v0, v1

    iput-object v0, p0, Lorg/eclipse/jgit/util/BlockList$MyIterator;->block:[Ljava/lang/Object;

    .line 341
    return-void
.end method

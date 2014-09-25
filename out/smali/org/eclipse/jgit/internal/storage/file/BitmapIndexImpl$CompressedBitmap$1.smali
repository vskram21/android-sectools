.class Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap$1;
.super Ljava/lang/Object;
.source "BitmapIndexImpl.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;->iterator()Ljava/util/Iterator;
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
        "Lorg/eclipse/jgit/lib/BitmapObject;",
        ">;"
    }
.end annotation


# instance fields
.field private cached:Lcom/googlecode/javaewah/IntIterator;

.field private final out:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$BitmapObjectImpl;

.field final synthetic this$1:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;

.field private type:I

.field final synthetic val$blobs:Lcom/googlecode/javaewah/IntIterator;

.field final synthetic val$commits:Lcom/googlecode/javaewah/IntIterator;

.field final synthetic val$dynamic:Lcom/googlecode/javaewah/IntIterator;

.field final synthetic val$tags:Lcom/googlecode/javaewah/IntIterator;

.field final synthetic val$trees:Lcom/googlecode/javaewah/IntIterator;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;Lcom/googlecode/javaewah/IntIterator;Lcom/googlecode/javaewah/IntIterator;Lcom/googlecode/javaewah/IntIterator;Lcom/googlecode/javaewah/IntIterator;Lcom/googlecode/javaewah/IntIterator;)V
    .locals 2
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 337
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap$1;->this$1:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;

    iput-object p2, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap$1;->val$dynamic:Lcom/googlecode/javaewah/IntIterator;

    iput-object p3, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap$1;->val$commits:Lcom/googlecode/javaewah/IntIterator;

    iput-object p4, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap$1;->val$trees:Lcom/googlecode/javaewah/IntIterator;

    iput-object p5, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap$1;->val$blobs:Lcom/googlecode/javaewah/IntIterator;

    iput-object p6, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap$1;->val$tags:Lcom/googlecode/javaewah/IntIterator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 338
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$BitmapObjectImpl;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$BitmapObjectImpl;-><init>(Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$1;)V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap$1;->out:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$BitmapObjectImpl;

    .line 340
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap$1;->val$dynamic:Lcom/googlecode/javaewah/IntIterator;

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap$1;->cached:Lcom/googlecode/javaewah/IntIterator;

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 343
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap$1;->cached:Lcom/googlecode/javaewah/IntIterator;

    invoke-interface {v1}, Lcom/googlecode/javaewah/IntIterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_0

    .line 344
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap$1;->val$commits:Lcom/googlecode/javaewah/IntIterator;

    invoke-interface {v1}, Lcom/googlecode/javaewah/IntIterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 345
    iput v0, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap$1;->type:I

    .line 346
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap$1;->val$commits:Lcom/googlecode/javaewah/IntIterator;

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap$1;->cached:Lcom/googlecode/javaewah/IntIterator;

    .line 360
    :cond_0
    :goto_0
    return v0

    .line 347
    :cond_1
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap$1;->val$trees:Lcom/googlecode/javaewah/IntIterator;

    invoke-interface {v1}, Lcom/googlecode/javaewah/IntIterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 348
    const/4 v1, 0x2

    iput v1, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap$1;->type:I

    .line 349
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap$1;->val$trees:Lcom/googlecode/javaewah/IntIterator;

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap$1;->cached:Lcom/googlecode/javaewah/IntIterator;

    goto :goto_0

    .line 350
    :cond_2
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap$1;->val$blobs:Lcom/googlecode/javaewah/IntIterator;

    invoke-interface {v1}, Lcom/googlecode/javaewah/IntIterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 351
    const/4 v1, 0x3

    iput v1, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap$1;->type:I

    .line 352
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap$1;->val$blobs:Lcom/googlecode/javaewah/IntIterator;

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap$1;->cached:Lcom/googlecode/javaewah/IntIterator;

    goto :goto_0

    .line 353
    :cond_3
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap$1;->val$tags:Lcom/googlecode/javaewah/IntIterator;

    invoke-interface {v1}, Lcom/googlecode/javaewah/IntIterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 354
    const/4 v1, 0x4

    iput v1, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap$1;->type:I

    .line 355
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap$1;->val$tags:Lcom/googlecode/javaewah/IntIterator;

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap$1;->cached:Lcom/googlecode/javaewah/IntIterator;

    goto :goto_0

    .line 357
    :cond_4
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 337
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap$1;->next()Lorg/eclipse/jgit/lib/BitmapObject;

    move-result-object v0

    return-object v0
.end method

.method public next()Lorg/eclipse/jgit/lib/BitmapObject;
    .locals 4

    .prologue
    .line 364
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap$1;->hasNext()Z

    move-result v2

    if-nez v2, :cond_0

    .line 365
    new-instance v2, Ljava/util/NoSuchElementException;

    invoke-direct {v2}, Ljava/util/NoSuchElementException;-><init>()V

    throw v2

    .line 367
    :cond_0
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap$1;->cached:Lcom/googlecode/javaewah/IntIterator;

    invoke-interface {v2}, Lcom/googlecode/javaewah/IntIterator;->next()I

    move-result v1

    .line 368
    .local v1, position:I
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap$1;->this$1:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;

    iget-object v2, v2, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;->this$0:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;

    #getter for: Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;->indexObjectCount:I
    invoke-static {v2}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;->access$1000(Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;)I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 369
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap$1;->out:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$BitmapObjectImpl;

    iget v3, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap$1;->type:I

    #setter for: Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$BitmapObjectImpl;->type:I
    invoke-static {v2, v3}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$BitmapObjectImpl;->access$1402(Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$BitmapObjectImpl;I)I

    .line 370
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap$1;->out:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$BitmapObjectImpl;

    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap$1;->this$1:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;

    iget-object v3, v3, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;->this$0:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;

    #getter for: Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;->packIndex:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;
    invoke-static {v3}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;->access$900(Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;)Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;

    move-result-object v3

    invoke-virtual {v3, v1}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;->getObject(I)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    #setter for: Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$BitmapObjectImpl;->objectId:Lorg/eclipse/jgit/lib/ObjectId;
    invoke-static {v2, v3}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$BitmapObjectImpl;->access$1502(Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$BitmapObjectImpl;Lorg/eclipse/jgit/lib/ObjectId;)Lorg/eclipse/jgit/lib/ObjectId;

    .line 377
    :goto_0
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap$1;->out:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$BitmapObjectImpl;

    return-object v2

    .line 372
    :cond_1
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap$1;->this$1:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;

    iget-object v2, v2, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;->this$0:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;

    #getter for: Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;->indexObjectCount:I
    invoke-static {v2}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;->access$1000(Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;)I

    move-result v2

    sub-int/2addr v1, v2

    .line 373
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap$1;->this$1:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;

    iget-object v2, v2, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;->this$0:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;

    #getter for: Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;->mutableIndex:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$MutableBitmapIndex;
    invoke-static {v2}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;->access$1600(Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;)Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$MutableBitmapIndex;

    move-result-object v2

    invoke-virtual {v2, v1}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$MutableBitmapIndex;->getObject(I)Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$MutableEntry;

    move-result-object v0

    .line 374
    .local v0, entry:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$MutableEntry;
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap$1;->out:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$BitmapObjectImpl;

    #getter for: Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$MutableEntry;->type:I
    invoke-static {v0}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$MutableEntry;->access$1700(Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$MutableEntry;)I

    move-result v3

    #setter for: Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$BitmapObjectImpl;->type:I
    invoke-static {v2, v3}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$BitmapObjectImpl;->access$1402(Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$BitmapObjectImpl;I)I

    .line 375
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap$1;->out:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$BitmapObjectImpl;

    #setter for: Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$BitmapObjectImpl;->objectId:Lorg/eclipse/jgit/lib/ObjectId;
    invoke-static {v2, v0}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$BitmapObjectImpl;->access$1502(Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$BitmapObjectImpl;Lorg/eclipse/jgit/lib/ObjectId;)Lorg/eclipse/jgit/lib/ObjectId;

    goto :goto_0
.end method

.method public remove()V
    .locals 1

    .prologue
    .line 381
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

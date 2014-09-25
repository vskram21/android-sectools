.class final Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;
.super Ljava/lang/Object;
.source "BitmapIndexImpl.java"

# interfaces
.implements Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "CompressedBitmap"
.end annotation


# instance fields
.field private final bitmap:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

.field final synthetic this$0:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;


# direct methods
.method private constructor <init>(Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;Lcom/googlecode/javaewah/EWAHCompressedBitmap;)V
    .locals 0
    .parameter
    .parameter "bitmap"

    .prologue
    .line 300
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;->this$0:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 301
    iput-object p2, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;->bitmap:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    .line 302
    return-void
.end method

.method synthetic constructor <init>(Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;Lcom/googlecode/javaewah/EWAHCompressedBitmap;Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 297
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;-><init>(Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;Lcom/googlecode/javaewah/EWAHCompressedBitmap;)V

    return-void
.end method

.method static synthetic access$1900(Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;)Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;
    .locals 1
    .parameter "x0"

    .prologue
    .line 297
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;->getPackBitmapIndex()Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$700(Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    .locals 1
    .parameter "x0"

    .prologue
    .line 297
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;->bitmap:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    return-object v0
.end method

.method private bitmapOf(Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    .locals 2
    .parameter "other"

    .prologue
    .line 317
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;->this$0:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;

    #calls: Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;->isSameCompressedBitmap(Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;)Z
    invoke-static {v1, p1}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;->access$600(Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 318
    check-cast p1, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;

    .end local p1
    iget-object v1, p1, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;->bitmap:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    .line 323
    :goto_0
    return-object v1

    .line 319
    .restart local p1
    :cond_0
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;->this$0:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;

    #calls: Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;->isSameCompressedBitmapBuilder(Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;)Z
    invoke-static {v1, p1}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;->access$800(Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 320
    check-cast p1, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;

    .end local p1
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;->build()Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;->bitmap:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    goto :goto_0

    .line 321
    .restart local p1
    :cond_1
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;->this$0:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;

    invoke-virtual {v1}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;->newBitmapBuilder()Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;

    move-result-object v0

    .line 322
    .local v0, builder:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;
    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;->or(Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;)Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;

    .line 323
    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;->build()Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;->bitmap:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    goto :goto_0
.end method

.method private getPackBitmapIndex()Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;
    .locals 1

    .prologue
    .line 391
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;->this$0:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;

    return-object v0
.end method

.method private final ofObjectType(I)Lcom/googlecode/javaewah/IntIterator;
    .locals 2
    .parameter "type"

    .prologue
    .line 327
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;->this$0:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;

    #getter for: Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;->packIndex:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;
    invoke-static {v0}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;->access$900(Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;)Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;

    move-result-object v0

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;->bitmap:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    invoke-virtual {v0, v1, p1}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;->ofObjectType(Lcom/googlecode/javaewah/EWAHCompressedBitmap;I)Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v0

    invoke-virtual {v0}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->intIterator()Lcom/googlecode/javaewah/IntIterator;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public andNot(Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;)Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;
    .locals 4
    .parameter "other"

    .prologue
    .line 309
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;->this$0:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;->bitmap:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    invoke-direct {p0, p1}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;->bitmapOf(Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->andNot(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;-><init>(Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;Lcom/googlecode/javaewah/EWAHCompressedBitmap;)V

    return-object v0
.end method

.method public bridge synthetic andNot(Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;)Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;
    .locals 1
    .parameter "x0"

    .prologue
    .line 297
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;->andNot(Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;)Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;

    move-result-object v0

    return-object v0
.end method

.method getEwahCompressedBitmap()Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    .locals 1

    .prologue
    .line 387
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;->bitmap:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    return-object v0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lorg/eclipse/jgit/lib/BitmapObject;",
            ">;"
        }
    .end annotation

    .prologue
    .line 331
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;->bitmap:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;->this$0:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;

    #getter for: Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;->indexObjectCount:I
    invoke-static {v1}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;->access$1000(Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;)I

    move-result v1

    #calls: Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;->ones(I)Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    invoke-static {v1}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;->access$1100(I)Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->andNot(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v0

    invoke-virtual {v0}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->intIterator()Lcom/googlecode/javaewah/IntIterator;

    move-result-object v2

    .line 333
    .local v2, dynamic:Lcom/googlecode/javaewah/IntIterator;
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;->ofObjectType(I)Lcom/googlecode/javaewah/IntIterator;

    move-result-object v3

    .line 334
    .local v3, commits:Lcom/googlecode/javaewah/IntIterator;
    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;->ofObjectType(I)Lcom/googlecode/javaewah/IntIterator;

    move-result-object v4

    .line 335
    .local v4, trees:Lcom/googlecode/javaewah/IntIterator;
    const/4 v0, 0x3

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;->ofObjectType(I)Lcom/googlecode/javaewah/IntIterator;

    move-result-object v5

    .line 336
    .local v5, blobs:Lcom/googlecode/javaewah/IntIterator;
    const/4 v0, 0x4

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;->ofObjectType(I)Lcom/googlecode/javaewah/IntIterator;

    move-result-object v6

    .line 337
    .local v6, tags:Lcom/googlecode/javaewah/IntIterator;
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap$1;

    move-object v1, p0

    invoke-direct/range {v0 .. v6}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap$1;-><init>(Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;Lcom/googlecode/javaewah/IntIterator;Lcom/googlecode/javaewah/IntIterator;Lcom/googlecode/javaewah/IntIterator;Lcom/googlecode/javaewah/IntIterator;Lcom/googlecode/javaewah/IntIterator;)V

    return-object v0
.end method

.method public or(Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;)Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;
    .locals 4
    .parameter "other"

    .prologue
    .line 305
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;->this$0:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;->bitmap:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    invoke-direct {p0, p1}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;->bitmapOf(Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->or(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;-><init>(Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;Lcom/googlecode/javaewah/EWAHCompressedBitmap;)V

    return-object v0
.end method

.method public bridge synthetic or(Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;)Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;
    .locals 1
    .parameter "x0"

    .prologue
    .line 297
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;->or(Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;)Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;

    move-result-object v0

    return-object v0
.end method

.method public xor(Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;)Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;
    .locals 4
    .parameter "other"

    .prologue
    .line 313
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;->this$0:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;->bitmap:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    invoke-direct {p0, p1}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;->bitmapOf(Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->xor(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;-><init>(Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;Lcom/googlecode/javaewah/EWAHCompressedBitmap;)V

    return-object v0
.end method

.method public bridge synthetic xor(Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;)Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;
    .locals 1
    .parameter "x0"

    .prologue
    .line 297
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;->xor(Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;)Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;

    move-result-object v0

    return-object v0
.end method

.class public Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;
.super Ljava/lang/Object;
.source "BitmapIndexImpl.java"

# interfaces
.implements Lorg/eclipse/jgit/lib/BitmapIndex;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$1;,
        Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$BitmapObjectImpl;,
        Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$ComboBitset;,
        Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;,
        Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;,
        Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$MutableBitmapIndex;,
        Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$MutableEntry;
    }
.end annotation


# static fields
.field private static final EXTRA_BITS:I = 0x2800


# instance fields
.field private final indexObjectCount:I

.field private final mutableIndex:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$MutableBitmapIndex;

.field private final packIndex:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;


# direct methods
.method public constructor <init>(Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;)V
    .locals 2
    .parameter "packIndex"

    .prologue
    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 79
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;->packIndex:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;

    .line 80
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$MutableBitmapIndex;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$MutableBitmapIndex;-><init>(Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$1;)V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;->mutableIndex:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$MutableBitmapIndex;

    .line 81
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;->getObjectCount()I

    move-result v0

    iput v0, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;->indexObjectCount:I

    .line 82
    return-void
.end method

.method static synthetic access$1000(Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 63
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;->indexObjectCount:I

    return v0
.end method

.method static synthetic access$1100(I)Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    .locals 1
    .parameter "x0"

    .prologue
    .line 63
    invoke-static {p0}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;->ones(I)Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1600(Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;)Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$MutableBitmapIndex;
    .locals 1
    .parameter "x0"

    .prologue
    .line 63
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;->mutableIndex:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$MutableBitmapIndex;

    return-object v0
.end method

.method static synthetic access$400(Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;Lorg/eclipse/jgit/lib/AnyObjectId;I)I
    .locals 1
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 63
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;->addObject(Lorg/eclipse/jgit/lib/AnyObjectId;I)I

    move-result v0

    return v0
.end method

.method static synthetic access$500(Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;Lorg/eclipse/jgit/lib/AnyObjectId;)I
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 63
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;->findPosition(Lorg/eclipse/jgit/lib/AnyObjectId;)I

    move-result v0

    return v0
.end method

.method static synthetic access$600(Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;)Z
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 63
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;->isSameCompressedBitmap(Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$800(Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;)Z
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 63
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;->isSameCompressedBitmapBuilder(Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$900(Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;)Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;
    .locals 1
    .parameter "x0"

    .prologue
    .line 63
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;->packIndex:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;

    return-object v0
.end method

.method private addObject(Lorg/eclipse/jgit/lib/AnyObjectId;I)I
    .locals 2
    .parameter "objectId"
    .parameter "type"

    .prologue
    .line 110
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;->findPosition(Lorg/eclipse/jgit/lib/AnyObjectId;)I

    move-result v0

    .line 111
    .local v0, position:I
    if-gez v0, :cond_0

    .line 112
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;->mutableIndex:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$MutableBitmapIndex;

    invoke-virtual {v1, p1, p2}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$MutableBitmapIndex;->addObject(Lorg/eclipse/jgit/lib/AnyObjectId;I)I

    move-result v0

    .line 113
    iget v1, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;->indexObjectCount:I

    add-int/2addr v0, v1

    .line 115
    :cond_0
    return v0
.end method

.method private findPosition(Lorg/eclipse/jgit/lib/AnyObjectId;)I
    .locals 2
    .parameter "objectId"

    .prologue
    .line 100
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;->packIndex:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;

    invoke-virtual {v1, p1}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;->findPosition(Lorg/eclipse/jgit/lib/AnyObjectId;)I

    move-result v0

    .line 101
    .local v0, position:I
    if-gez v0, :cond_0

    .line 102
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;->mutableIndex:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$MutableBitmapIndex;

    invoke-virtual {v1, p1}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$MutableBitmapIndex;->findPosition(Lorg/eclipse/jgit/lib/AnyObjectId;)I

    move-result v0

    .line 103
    if-ltz v0, :cond_0

    .line 104
    iget v1, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;->indexObjectCount:I

    add-int/2addr v0, v1

    .line 106
    :cond_0
    return v0
.end method

.method private isSameCompressedBitmap(Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;)Z
    .locals 3
    .parameter "other"

    .prologue
    const/4 v1, 0x0

    .line 460
    instance-of v2, p1, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;

    if-eqz v2, :cond_0

    move-object v0, p1

    .line 461
    check-cast v0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;

    .line 462
    .local v0, b:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;
    #calls: Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;->getPackBitmapIndex()Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;
    invoke-static {v0}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;->access$1900(Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;)Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;

    move-result-object v2

    if-ne p0, v2, :cond_0

    const/4 v1, 0x1

    .line 464
    .end local v0           #b:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;
    :cond_0
    return v1
.end method

.method private isSameCompressedBitmapBuilder(Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;)Z
    .locals 3
    .parameter "other"

    .prologue
    const/4 v1, 0x0

    .line 468
    instance-of v2, p1, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;

    if-eqz v2, :cond_0

    move-object v0, p1

    .line 469
    check-cast v0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;

    .line 470
    .local v0, b:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;
    #calls: Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;->getBitmapIndex()Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;
    invoke-static {v0}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;->access$2000(Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;)Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;

    move-result-object v2

    if-ne p0, v2, :cond_0

    const/4 v1, 0x1

    .line 472
    .end local v0           #b:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;
    :cond_0
    return v1
.end method

.method private static final ones(I)Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    .locals 7
    .parameter "sizeInBits"

    .prologue
    const-wide/16 v5, 0x1

    .line 476
    new-instance v0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    invoke-direct {v0}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;-><init>()V

    .line 477
    .local v0, mask:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    const/4 v2, 0x1

    div-int/lit8 v3, p0, 0x40

    int-to-long v3, v3

    invoke-virtual {v0, v2, v3, v4}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->addStreamOfEmptyWords(ZJ)V

    .line 479
    rem-int/lit8 v1, p0, 0x40

    .line 480
    .local v1, remaining:I
    if-lez v1, :cond_0

    .line 481
    shl-long v2, v5, v1

    sub-long/2addr v2, v5

    invoke-virtual {v0, v2, v3, v1}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->add(JI)V

    .line 482
    :cond_0
    return-object v0
.end method


# virtual methods
.method public getBitmap(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;
    .locals 3
    .parameter "objectId"

    .prologue
    const/4 v1, 0x0

    .line 89
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;->packIndex:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;

    invoke-virtual {v2, p1}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;->getBitmap(Lorg/eclipse/jgit/lib/AnyObjectId;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v0

    .line 90
    .local v0, compressed:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    if-nez v0, :cond_0

    .line 92
    :goto_0
    return-object v1

    :cond_0
    new-instance v2, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;

    invoke-direct {v2, p0, v0, v1}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;-><init>(Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;Lcom/googlecode/javaewah/EWAHCompressedBitmap;Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$1;)V

    move-object v1, v2

    goto :goto_0
.end method

.method public bridge synthetic getBitmap(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;
    .locals 1
    .parameter "x0"

    .prologue
    .line 63
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;->getBitmap(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmap;

    move-result-object v0

    return-object v0
.end method

.method getPackBitmapIndex()Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;
    .locals 1

    .prologue
    .line 85
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;->packIndex:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;

    return-object v0
.end method

.method public newBitmapBuilder()Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;
    .locals 2

    .prologue
    .line 96
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;-><init>(Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$1;)V

    return-object v0
.end method

.method public bridge synthetic newBitmapBuilder()Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;
    .locals 1

    .prologue
    .line 63
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;->newBitmapBuilder()Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;

    move-result-object v0

    return-object v0
.end method

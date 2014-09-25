.class public Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper;
.super Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;
.source "PackBitmapIndexRemapper.java"

# interfaces
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper$Entry;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;",
        "Ljava/lang/Iterable",
        "<",
        "Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper$Entry;",
        ">;"
    }
.end annotation


# instance fields
.field private final convertedBitmaps:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/eclipse/jgit/lib/ObjectIdOwnerMap",
            "<",
            "Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$StoredBitmap;",
            ">;"
        }
    .end annotation
.end field

.field private final inflated:Lorg/eclipse/jgit/internal/storage/file/BitSet;

.field private final newPackIndex:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;

.field private final oldPackIndex:Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex;

.field private final prevToNewMapping:[I


# direct methods
.method private constructor <init>(Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex;Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;)V
    .locals 3
    .parameter "oldPackIndex"
    .parameter "newPackIndex"

    .prologue
    .line 107
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;-><init>()V

    .line 108
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper;->oldPackIndex:Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex;

    .line 109
    iput-object p2, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper;->newPackIndex:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;

    .line 110
    new-instance v1, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    invoke-direct {v1}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;-><init>()V

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper;->convertedBitmaps:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    .line 111
    new-instance v1, Lorg/eclipse/jgit/internal/storage/file/BitSet;

    invoke-virtual {p2}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;->getObjectCount()I

    move-result v2

    invoke-direct {v1, v2}, Lorg/eclipse/jgit/internal/storage/file/BitSet;-><init>(I)V

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper;->inflated:Lorg/eclipse/jgit/internal/storage/file/BitSet;

    .line 113
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex;->getObjectCount()I

    move-result v1

    new-array v1, v1, [I

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper;->prevToNewMapping:[I

    .line 114
    const/4 v0, 0x0

    .local v0, pos:I
    :goto_0
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper;->prevToNewMapping:[I

    array-length v1, v1

    if-ge v0, v1, :cond_0

    .line 115
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper;->prevToNewMapping:[I

    invoke-virtual {p1, v0}, Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex;->getObject(I)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    invoke-virtual {p2, v2}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;->findPosition(Lorg/eclipse/jgit/lib/AnyObjectId;)I

    move-result v2

    aput v2, v1, v0

    .line 114
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 117
    :cond_0
    return-void
.end method

.method private constructor <init>(Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;)V
    .locals 1
    .parameter "newPackIndex"

    .prologue
    const/4 v0, 0x0

    .line 98
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;-><init>()V

    .line 99
    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper;->oldPackIndex:Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex;

    .line 100
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper;->newPackIndex:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;

    .line 101
    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper;->convertedBitmaps:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    .line 102
    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper;->inflated:Lorg/eclipse/jgit/internal/storage/file/BitSet;

    .line 103
    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper;->prevToNewMapping:[I

    .line 104
    return-void
.end method

.method static synthetic access$000(Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper;)Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;
    .locals 1
    .parameter "x0"

    .prologue
    .line 65
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper;->newPackIndex:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;

    return-object v0
.end method

.method public static newPackBitmapIndex(Lorg/eclipse/jgit/lib/BitmapIndex;Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;)Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper;
    .locals 2
    .parameter "prevBitmapIndex"
    .parameter "newIndex"

    .prologue
    .line 86
    instance-of v1, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;

    if-nez v1, :cond_0

    .line 87
    new-instance v1, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper;

    invoke-direct {v1, p1}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper;-><init>(Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;)V

    .line 94
    .end local p0
    :goto_0
    return-object v1

    .line 89
    .restart local p0
    :cond_0
    check-cast p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;

    .end local p0
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;->getPackBitmapIndex()Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;

    move-result-object v0

    .line 91
    .local v0, prevIndex:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;
    instance-of v1, v0, Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex;

    if-nez v1, :cond_1

    .line 92
    new-instance v1, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper;

    invoke-direct {v1, p1}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper;-><init>(Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;)V

    goto :goto_0

    .line 94
    :cond_1
    new-instance v1, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper;

    check-cast v0, Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex;

    .end local v0           #prevIndex:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;
    invoke-direct {v1, v0, p1}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper;-><init>(Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex;Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;)V

    goto :goto_0
.end method


# virtual methods
.method public findPosition(Lorg/eclipse/jgit/lib/AnyObjectId;)I
    .locals 1
    .parameter "objectId"

    .prologue
    .line 121
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper;->newPackIndex:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;->findPosition(Lorg/eclipse/jgit/lib/AnyObjectId;)I

    move-result v0

    return v0
.end method

.method public getBitmap(Lorg/eclipse/jgit/lib/AnyObjectId;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    .locals 8
    .parameter "objectId"

    .prologue
    const/4 v4, 0x0

    .line 174
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper;->newPackIndex:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;

    invoke-virtual {v5, p1}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;->getBitmap(Lorg/eclipse/jgit/lib/AnyObjectId;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v0

    .line 175
    .local v0, bitmap:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    if-nez v0, :cond_0

    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper;->oldPackIndex:Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex;

    if-nez v5, :cond_2

    :cond_0
    move-object v4, v0

    .line 195
    :cond_1
    :goto_0
    return-object v4

    .line 178
    :cond_2
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper;->convertedBitmaps:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    invoke-virtual {v5, p1}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->get(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;

    move-result-object v3

    check-cast v3, Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$StoredBitmap;

    .line 179
    .local v3, stored:Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$StoredBitmap;
    if-eqz v3, :cond_3

    .line 180
    invoke-virtual {v3}, Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$StoredBitmap;->getBitmap()Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v4

    goto :goto_0

    .line 182
    :cond_3
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper;->oldPackIndex:Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex;

    invoke-virtual {v5}, Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex;->getBitmaps()Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    move-result-object v5

    invoke-virtual {v5, p1}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->get(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$StoredBitmap;

    .line 183
    .local v2, oldBitmap:Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$StoredBitmap;
    if-eqz v2, :cond_1

    .line 186
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper;->newPackIndex:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;

    invoke-virtual {v5, p1}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;->findPosition(Lorg/eclipse/jgit/lib/AnyObjectId;)I

    move-result v5

    const/4 v6, -0x1

    if-eq v5, v6, :cond_1

    .line 189
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper;->inflated:Lorg/eclipse/jgit/internal/storage/file/BitSet;

    invoke-virtual {v5}, Lorg/eclipse/jgit/internal/storage/file/BitSet;->clear()V

    .line 190
    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$StoredBitmap;->getBitmap()Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v5

    invoke-virtual {v5}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->intIterator()Lcom/googlecode/javaewah/IntIterator;

    move-result-object v1

    .local v1, i:Lcom/googlecode/javaewah/IntIterator;
    :goto_1
    invoke-interface {v1}, Lcom/googlecode/javaewah/IntIterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_4

    .line 191
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper;->inflated:Lorg/eclipse/jgit/internal/storage/file/BitSet;

    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper;->prevToNewMapping:[I

    invoke-interface {v1}, Lcom/googlecode/javaewah/IntIterator;->next()I

    move-result v7

    aget v6, v6, v7

    invoke-virtual {v5, v6}, Lorg/eclipse/jgit/internal/storage/file/BitSet;->set(I)V

    goto :goto_1

    .line 192
    :cond_4
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper;->inflated:Lorg/eclipse/jgit/internal/storage/file/BitSet;

    invoke-virtual {v5}, Lorg/eclipse/jgit/internal/storage/file/BitSet;->toEWAHCompressedBitmap()Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v0

    .line 193
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper;->convertedBitmaps:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    new-instance v6, Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$StoredBitmap;

    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$StoredBitmap;->getFlags()I

    move-result v7

    invoke-direct {v6, p1, v0, v4, v7}, Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$StoredBitmap;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;Lcom/googlecode/javaewah/EWAHCompressedBitmap;Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$StoredBitmap;I)V

    invoke-virtual {v5, v6}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->add(Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;)V

    move-object v4, v0

    .line 195
    goto :goto_0
.end method

.method public getObject(I)Lorg/eclipse/jgit/lib/ObjectId;
    .locals 1
    .parameter "position"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 126
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper;->newPackIndex:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;->getObject(I)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    return-object v0
.end method

.method public getObjectCount()I
    .locals 1

    .prologue
    .line 131
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper;->newPackIndex:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;

    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;->getObjectCount()I

    move-result v0

    return v0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper$Entry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 141
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper;->oldPackIndex:Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex;

    if-nez v1, :cond_0

    .line 142
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 145
    :goto_0
    return-object v1

    .line 144
    :cond_0
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper;->oldPackIndex:Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex;

    invoke-virtual {v1}, Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex;->getBitmaps()Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    move-result-object v1

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 145
    .local v0, it:Ljava/util/Iterator;,"Ljava/util/Iterator<Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$StoredBitmap;>;"
    new-instance v1, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper$1;

    invoke-direct {v1, p0, v0}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper$1;-><init>(Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper;Ljava/util/Iterator;)V

    goto :goto_0
.end method

.method public ofObjectType(Lcom/googlecode/javaewah/EWAHCompressedBitmap;I)Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    .locals 1
    .parameter "bitmap"
    .parameter "type"

    .prologue
    .line 137
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper;->newPackIndex:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;

    invoke-virtual {v0, p1, p2}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;->ofObjectType(Lcom/googlecode/javaewah/EWAHCompressedBitmap;I)Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v0

    return-object v0
.end method

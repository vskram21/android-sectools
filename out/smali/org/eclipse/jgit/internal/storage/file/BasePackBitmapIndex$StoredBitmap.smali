.class final Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$StoredBitmap;
.super Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;
.source "BasePackBitmapIndex.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "StoredBitmap"
.end annotation


# instance fields
.field private volatile bitmapContainer:Ljava/lang/Object;

.field private final flags:I


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/lib/AnyObjectId;Lcom/googlecode/javaewah/EWAHCompressedBitmap;Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$StoredBitmap;I)V
    .locals 1
    .parameter "objectId"
    .parameter "bitmap"
    .parameter "xorBitmap"
    .parameter "flags"

    .prologue
    .line 80
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 81
    if-nez p3, :cond_0

    .end local p2
    :goto_0
    iput-object p2, p0, Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$StoredBitmap;->bitmapContainer:Ljava/lang/Object;

    .line 84
    iput p4, p0, Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$StoredBitmap;->flags:I

    .line 85
    return-void

    .line 81
    .restart local p2
    :cond_0
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$XorCompressedBitmap;

    invoke-direct {v0, p2, p3}, Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$XorCompressedBitmap;-><init>(Lcom/googlecode/javaewah/EWAHCompressedBitmap;Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$StoredBitmap;)V

    move-object p2, v0

    goto :goto_0
.end method


# virtual methods
.method getBitmap()Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    .locals 4

    .prologue
    .line 94
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$StoredBitmap;->bitmapContainer:Ljava/lang/Object;

    .line 95
    .local v1, r:Ljava/lang/Object;
    instance-of v3, v1, Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    if-eqz v3, :cond_0

    move-object v3, v1

    .line 96
    check-cast v3, Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    .line 106
    :goto_0
    return-object v3

    :cond_0
    move-object v2, v1

    .line 99
    check-cast v2, Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$XorCompressedBitmap;

    .line 100
    .local v2, xb:Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$XorCompressedBitmap;
    iget-object v0, v2, Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$XorCompressedBitmap;->bitmap:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    .line 102
    .local v0, out:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    :goto_1
    iget-object v3, v2, Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$XorCompressedBitmap;->xorBitmap:Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$StoredBitmap;

    iget-object v1, v3, Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$StoredBitmap;->bitmapContainer:Ljava/lang/Object;

    .line 103
    instance-of v3, v1, Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    if-eqz v3, :cond_1

    move-object v3, v1

    .line 104
    check-cast v3, Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    invoke-virtual {v0, v3}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->xor(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v0

    .line 105
    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$StoredBitmap;->bitmapContainer:Ljava/lang/Object;

    move-object v3, v0

    .line 106
    goto :goto_0

    :cond_1
    move-object v2, v1

    .line 108
    check-cast v2, Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$XorCompressedBitmap;

    .line 109
    iget-object v3, v2, Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$XorCompressedBitmap;->bitmap:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    invoke-virtual {v0, v3}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->xor(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v0

    goto :goto_1
.end method

.method getFlags()I
    .locals 1

    .prologue
    .line 115
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$StoredBitmap;->flags:I

    return v0
.end method

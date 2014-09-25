.class abstract Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex;
.super Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;
.source "BasePackBitmapIndex.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$StoredBitmap;,
        Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$XorCompressedBitmap;
    }
.end annotation


# instance fields
.field private final bitmaps:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/eclipse/jgit/lib/ObjectIdOwnerMap",
            "<",
            "Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$StoredBitmap;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;)V
    .locals 0
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/lib/ObjectIdOwnerMap",
            "<",
            "Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$StoredBitmap;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 57
    .local p1, bitmaps:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;,"Lorg/eclipse/jgit/lib/ObjectIdOwnerMap<Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$StoredBitmap;>;"
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;-><init>()V

    .line 58
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex;->bitmaps:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    .line 59
    return-void
.end method


# virtual methods
.method public getBitmap(Lorg/eclipse/jgit/lib/AnyObjectId;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    .locals 2
    .parameter "objectId"

    .prologue
    .line 62
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex;->bitmaps:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    invoke-virtual {v1, p1}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->get(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$StoredBitmap;

    .line 63
    .local v0, sb:Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$StoredBitmap;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$StoredBitmap;->getBitmap()Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v1

    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method getBitmaps()Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/eclipse/jgit/lib/ObjectIdOwnerMap",
            "<",
            "Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$StoredBitmap;",
            ">;"
        }
    .end annotation

    .prologue
    .line 67
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex;->bitmaps:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    return-object v0
.end method

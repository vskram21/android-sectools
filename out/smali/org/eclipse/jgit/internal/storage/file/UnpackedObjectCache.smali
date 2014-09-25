.class Lorg/eclipse/jgit/internal/storage/file/UnpackedObjectCache;
.super Ljava/lang/Object;
.source "UnpackedObjectCache.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/internal/storage/file/UnpackedObjectCache$Table;
    }
.end annotation


# static fields
.field private static final INITIAL_BITS:I = 0x5

.field private static final MAX_BITS:I = 0xb


# instance fields
.field private volatile table:Lorg/eclipse/jgit/internal/storage/file/UnpackedObjectCache$Table;


# direct methods
.method constructor <init>()V
    .locals 2

    .prologue
    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/UnpackedObjectCache$Table;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/internal/storage/file/UnpackedObjectCache$Table;-><init>(I)V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/UnpackedObjectCache;->table:Lorg/eclipse/jgit/internal/storage/file/UnpackedObjectCache$Table;

    .line 61
    return-void
.end method


# virtual methods
.method add(Lorg/eclipse/jgit/lib/AnyObjectId;)V
    .locals 4
    .parameter "objectId"

    .prologue
    .line 68
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/UnpackedObjectCache;->table:Lorg/eclipse/jgit/internal/storage/file/UnpackedObjectCache$Table;

    .line 69
    .local v1, t:Lorg/eclipse/jgit/internal/storage/file/UnpackedObjectCache$Table;
    invoke-virtual {v1, p1}, Lorg/eclipse/jgit/internal/storage/file/UnpackedObjectCache$Table;->add(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 82
    :goto_0
    return-void

    .line 78
    :cond_0
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/UnpackedObjectCache$Table;

    iget v2, v1, Lorg/eclipse/jgit/internal/storage/file/UnpackedObjectCache$Table;->bits:I

    add-int/lit8 v2, v2, 0x1

    const/16 v3, 0xb

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    invoke-direct {v0, v2}, Lorg/eclipse/jgit/internal/storage/file/UnpackedObjectCache$Table;-><init>(I)V

    .line 79
    .local v0, n:Lorg/eclipse/jgit/internal/storage/file/UnpackedObjectCache$Table;
    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/internal/storage/file/UnpackedObjectCache$Table;->add(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    .line 80
    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/UnpackedObjectCache;->table:Lorg/eclipse/jgit/internal/storage/file/UnpackedObjectCache$Table;

    goto :goto_0
.end method

.method clear()V
    .locals 2

    .prologue
    .line 90
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/UnpackedObjectCache$Table;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/internal/storage/file/UnpackedObjectCache$Table;-><init>(I)V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/UnpackedObjectCache;->table:Lorg/eclipse/jgit/internal/storage/file/UnpackedObjectCache$Table;

    .line 91
    return-void
.end method

.method isUnpacked(Lorg/eclipse/jgit/lib/AnyObjectId;)Z
    .locals 1
    .parameter "objectId"

    .prologue
    .line 64
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/UnpackedObjectCache;->table:Lorg/eclipse/jgit/internal/storage/file/UnpackedObjectCache$Table;

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/internal/storage/file/UnpackedObjectCache$Table;->contains(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v0

    return v0
.end method

.method remove(Lorg/eclipse/jgit/lib/AnyObjectId;)V
    .locals 1
    .parameter "objectId"

    .prologue
    .line 85
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/internal/storage/file/UnpackedObjectCache;->isUnpacked(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 86
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/UnpackedObjectCache;->clear()V

    .line 87
    :cond_0
    return-void
.end method

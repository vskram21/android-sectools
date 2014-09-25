.class Lorg/eclipse/jgit/internal/storage/file/UnpackedObjectCache$Table;
.super Ljava/lang/Object;
.source "UnpackedObjectCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/internal/storage/file/UnpackedObjectCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Table"
.end annotation


# static fields
.field private static final MAX_CHAIN:I = 0x8


# instance fields
.field final bits:I

.field private final ids:Ljava/util/concurrent/atomic/AtomicReferenceArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReferenceArray",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;"
        }
    .end annotation
.end field

.field private final shift:I


# direct methods
.method constructor <init>(I)V
    .locals 2
    .parameter "bits"

    .prologue
    .line 102
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 103
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReferenceArray;

    const/4 v1, 0x1

    shl-int/2addr v1, p1

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReferenceArray;-><init>(I)V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/UnpackedObjectCache$Table;->ids:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 104
    rsub-int/lit8 v0, p1, 0x20

    iput v0, p0, Lorg/eclipse/jgit/internal/storage/file/UnpackedObjectCache$Table;->shift:I

    .line 105
    iput p1, p0, Lorg/eclipse/jgit/internal/storage/file/UnpackedObjectCache$Table;->bits:I

    .line 106
    return-void
.end method

.method private index(Lorg/eclipse/jgit/lib/AnyObjectId;)I
    .locals 2
    .parameter "id"

    .prologue
    .line 146
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/AnyObjectId;->hashCode()I

    move-result v0

    iget v1, p0, Lorg/eclipse/jgit/internal/storage/file/UnpackedObjectCache$Table;->shift:I

    ushr-int/2addr v0, v1

    return v0
.end method


# virtual methods
.method add(Lorg/eclipse/jgit/lib/AnyObjectId;)Z
    .locals 7
    .parameter "toAdd"

    .prologue
    const/4 v3, 0x1

    .line 125
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/internal/storage/file/UnpackedObjectCache$Table;->index(Lorg/eclipse/jgit/lib/AnyObjectId;)I

    move-result v0

    .line 126
    .local v0, i:I
    const/4 v1, 0x0

    .local v1, n:I
    :cond_0
    :goto_0
    const/16 v4, 0x8

    if-ge v1, v4, :cond_4

    .line 127
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/UnpackedObjectCache$Table;->ids:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    invoke-virtual {v4, v0}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/lib/ObjectId;

    .line 128
    .local v2, obj:Lorg/eclipse/jgit/lib/ObjectId;
    if-nez v2, :cond_2

    .line 129
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/UnpackedObjectCache$Table;->ids:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    const/4 v5, 0x0

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/AnyObjectId;->copy()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v6

    invoke-virtual {v4, v0, v5, v6}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->compareAndSet(ILjava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 142
    .end local v2           #obj:Lorg/eclipse/jgit/lib/ObjectId;
    :cond_1
    :goto_1
    return v3

    .line 135
    .restart local v2       #obj:Lorg/eclipse/jgit/lib/ObjectId;
    :cond_2
    invoke-static {v2, p1}, Lorg/eclipse/jgit/lib/AnyObjectId;->equals(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 138
    add-int/lit8 v0, v0, 0x1

    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/UnpackedObjectCache$Table;->ids:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->length()I

    move-result v4

    if-ne v0, v4, :cond_3

    .line 139
    const/4 v0, 0x0

    .line 140
    :cond_3
    add-int/lit8 v1, v1, 0x1

    .line 141
    goto :goto_0

    .line 142
    .end local v2           #obj:Lorg/eclipse/jgit/lib/ObjectId;
    :cond_4
    const/4 v3, 0x0

    goto :goto_1
.end method

.method contains(Lorg/eclipse/jgit/lib/AnyObjectId;)Z
    .locals 4
    .parameter "toFind"

    .prologue
    .line 109
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/internal/storage/file/UnpackedObjectCache$Table;->index(Lorg/eclipse/jgit/lib/AnyObjectId;)I

    move-result v0

    .line 110
    .local v0, i:I
    const/4 v1, 0x0

    .local v1, n:I
    :goto_0
    const/16 v3, 0x8

    if-ge v1, v3, :cond_0

    .line 111
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/UnpackedObjectCache$Table;->ids:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    invoke-virtual {v3, v0}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/lib/ObjectId;

    .line 112
    .local v2, obj:Lorg/eclipse/jgit/lib/ObjectId;
    if-nez v2, :cond_1

    .line 121
    .end local v2           #obj:Lorg/eclipse/jgit/lib/ObjectId;
    :cond_0
    const/4 v3, 0x0

    :goto_1
    return v3

    .line 115
    .restart local v2       #obj:Lorg/eclipse/jgit/lib/ObjectId;
    :cond_1
    invoke-static {v2, p1}, Lorg/eclipse/jgit/lib/AnyObjectId;->equals(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 116
    const/4 v3, 0x1

    goto :goto_1

    .line 118
    :cond_2
    add-int/lit8 v0, v0, 0x1

    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/UnpackedObjectCache$Table;->ids:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->length()I

    move-result v3

    if-ne v0, v3, :cond_3

    .line 119
    const/4 v0, 0x0

    .line 110
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

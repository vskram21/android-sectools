.class Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;
.super Ljava/lang/Object;
.source "DeltaBaseCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Slot"
.end annotation


# instance fields
.field data:Ljava/lang/ref/SoftReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/SoftReference",
            "<",
            "Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Entry;",
            ">;"
        }
    .end annotation
.end field

.field lruNext:Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;

.field lruPrev:Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;

.field position:J

.field provider:Lorg/eclipse/jgit/internal/storage/file/PackFile;

.field sz:I


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 177
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 188
    invoke-static {}, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache;->access$100()Ljava/lang/ref/SoftReference;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;->data:Ljava/lang/ref/SoftReference;

    return-void
.end method

.method synthetic constructor <init>(Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$1;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 177
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;-><init>()V

    return-void
.end method

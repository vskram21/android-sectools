.class Lorg/eclipse/jgit/internal/storage/pack/DeltaCache$Ref;
.super Ljava/lang/ref/SoftReference;
.source "DeltaCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/internal/storage/pack/DeltaCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Ref"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/ref/SoftReference",
        "<[B>;"
    }
.end annotation


# instance fields
.field final cost:I


# direct methods
.method constructor <init>([BLjava/lang/ref/ReferenceQueue;)V
    .locals 1
    .parameter "array"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([B",
            "Ljava/lang/ref/ReferenceQueue",
            "<[B>;)V"
        }
    .end annotation

    .prologue
    .line 132
    .local p2, queue:Ljava/lang/ref/ReferenceQueue;,"Ljava/lang/ref/ReferenceQueue<[B>;"
    invoke-direct {p0, p1, p2}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;Ljava/lang/ref/ReferenceQueue;)V

    .line 133
    array-length v0, p1

    iput v0, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaCache$Ref;->cost:I

    .line 134
    return-void
.end method

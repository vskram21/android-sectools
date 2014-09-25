.class final Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;
.super Ljava/lang/Object;
.source "DeltaTask.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Slice"
.end annotation


# instance fields
.field final beginIndex:I

.field final endIndex:I


# direct methods
.method constructor <init>(II)V
    .locals 0
    .parameter "b"
    .parameter "e"

    .prologue
    .line 242
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 243
    iput p1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;->beginIndex:I

    .line 244
    iput p2, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;->endIndex:I

    .line 245
    return-void
.end method


# virtual methods
.method final size()I
    .locals 2

    .prologue
    .line 248
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;->endIndex:I

    iget v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;->beginIndex:I

    sub-int/2addr v0, v1

    return v0
.end method

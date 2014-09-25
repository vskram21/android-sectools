.class Lorg/eclipse/jgit/internal/storage/file/PackFile$Delta;
.super Ljava/lang/Object;
.source "PackFile.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/internal/storage/file/PackFile;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Delta"
.end annotation


# instance fields
.field final basePos:J

.field final deltaPos:J

.field final deltaSize:I

.field final hdrLen:I

.field final next:Lorg/eclipse/jgit/internal/storage/file/PackFile$Delta;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/internal/storage/file/PackFile$Delta;JIIJ)V
    .locals 0
    .parameter "next"
    .parameter "ofs"
    .parameter "sz"
    .parameter "hdrLen"
    .parameter "baseOffset"

    .prologue
    .line 872
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 873
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile$Delta;->next:Lorg/eclipse/jgit/internal/storage/file/PackFile$Delta;

    .line 874
    iput-wide p2, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile$Delta;->deltaPos:J

    .line 875
    iput p4, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile$Delta;->deltaSize:I

    .line 876
    iput p5, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile$Delta;->hdrLen:I

    .line 877
    iput-wide p6, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile$Delta;->basePos:J

    .line 878
    return-void
.end method

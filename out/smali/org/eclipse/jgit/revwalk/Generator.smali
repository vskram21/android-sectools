.class abstract Lorg/eclipse/jgit/revwalk/Generator;
.super Ljava/lang/Object;
.source "Generator.java"


# static fields
.field static final HAS_REWRITE:I = 0x2

.field static final HAS_UNINTERESTING:I = 0x10

.field static final NEEDS_REWRITE:I = 0x4

.field static final SORT_COMMIT_TIME_DESC:I = 0x1

.field static final SORT_TOPO:I = 0x8


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method abstract next()Lorg/eclipse/jgit/revwalk/RevCommit;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method abstract outputType()I
.end method

.method shareFreeList(Lorg/eclipse/jgit/revwalk/BlockRevQueue;)V
    .locals 0
    .parameter "q"

    .prologue
    .line 86
    return-void
.end method

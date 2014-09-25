.class final Lorg/eclipse/jgit/lib/IndexDiff$ProgressReportingFilter;
.super Lorg/eclipse/jgit/treewalk/filter/TreeFilter;
.source "IndexDiff.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/lib/IndexDiff;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ProgressReportingFilter"
.end annotation


# instance fields
.field private count:I

.field private final monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

.field private stepSize:I

.field private final total:I


# direct methods
.method private constructor <init>(Lorg/eclipse/jgit/lib/ProgressMonitor;I)V
    .locals 1
    .parameter "monitor"
    .parameter "total"

    .prologue
    .line 200
    invoke-direct {p0}, Lorg/eclipse/jgit/treewalk/filter/TreeFilter;-><init>()V

    .line 194
    const/4 v0, 0x0

    iput v0, p0, Lorg/eclipse/jgit/lib/IndexDiff$ProgressReportingFilter;->count:I

    .line 201
    iput-object p1, p0, Lorg/eclipse/jgit/lib/IndexDiff$ProgressReportingFilter;->monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    .line 202
    iput p2, p0, Lorg/eclipse/jgit/lib/IndexDiff$ProgressReportingFilter;->total:I

    .line 203
    div-int/lit8 v0, p2, 0x64

    iput v0, p0, Lorg/eclipse/jgit/lib/IndexDiff$ProgressReportingFilter;->stepSize:I

    .line 204
    iget v0, p0, Lorg/eclipse/jgit/lib/IndexDiff$ProgressReportingFilter;->stepSize:I

    if-nez v0, :cond_0

    .line 205
    const/16 v0, 0x3e8

    iput v0, p0, Lorg/eclipse/jgit/lib/IndexDiff$ProgressReportingFilter;->stepSize:I

    .line 206
    :cond_0
    return-void
.end method

.method synthetic constructor <init>(Lorg/eclipse/jgit/lib/ProgressMonitor;ILorg/eclipse/jgit/lib/IndexDiff$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 190
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/lib/IndexDiff$ProgressReportingFilter;-><init>(Lorg/eclipse/jgit/lib/ProgressMonitor;I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 190
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/IndexDiff$ProgressReportingFilter;->clone()Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lorg/eclipse/jgit/treewalk/filter/TreeFilter;
    .locals 3

    .prologue
    .line 229
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Do not clone this kind of filter: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public include(Lorg/eclipse/jgit/treewalk/TreeWalk;)Z
    .locals 2
    .parameter "walker"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 217
    iget v0, p0, Lorg/eclipse/jgit/lib/IndexDiff$ProgressReportingFilter;->count:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/eclipse/jgit/lib/IndexDiff$ProgressReportingFilter;->count:I

    .line 218
    iget v0, p0, Lorg/eclipse/jgit/lib/IndexDiff$ProgressReportingFilter;->count:I

    iget v1, p0, Lorg/eclipse/jgit/lib/IndexDiff$ProgressReportingFilter;->stepSize:I

    rem-int/2addr v0, v1

    if-nez v0, :cond_1

    .line 219
    iget v0, p0, Lorg/eclipse/jgit/lib/IndexDiff$ProgressReportingFilter;->count:I

    iget v1, p0, Lorg/eclipse/jgit/lib/IndexDiff$ProgressReportingFilter;->total:I

    if-gt v0, v1, :cond_0

    .line 220
    iget-object v0, p0, Lorg/eclipse/jgit/lib/IndexDiff$ProgressReportingFilter;->monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    iget v1, p0, Lorg/eclipse/jgit/lib/IndexDiff$ProgressReportingFilter;->stepSize:I

    invoke-interface {v0, v1}, Lorg/eclipse/jgit/lib/ProgressMonitor;->update(I)V

    .line 221
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/lib/IndexDiff$ProgressReportingFilter;->monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    invoke-interface {v0}, Lorg/eclipse/jgit/lib/ProgressMonitor;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 222
    sget-object v0, Lorg/eclipse/jgit/errors/StopWalkException;->INSTANCE:Lorg/eclipse/jgit/errors/StopWalkException;

    throw v0

    .line 224
    :cond_1
    const/4 v0, 0x1

    return v0
.end method

.method public shouldBeRecursive()Z
    .locals 1

    .prologue
    .line 210
    const/4 v0, 0x0

    return v0
.end method

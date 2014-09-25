.class abstract Lorg/eclipse/jgit/revwalk/AbstractRevQueue;
.super Lorg/eclipse/jgit/revwalk/Generator;
.source "AbstractRevQueue.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/revwalk/AbstractRevQueue$1;,
        Lorg/eclipse/jgit/revwalk/AbstractRevQueue$AlwaysEmptyQueue;
    }
.end annotation


# static fields
.field static final EMPTY_QUEUE:Lorg/eclipse/jgit/revwalk/AbstractRevQueue;


# instance fields
.field outputType:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 47
    new-instance v0, Lorg/eclipse/jgit/revwalk/AbstractRevQueue$AlwaysEmptyQueue;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/revwalk/AbstractRevQueue$AlwaysEmptyQueue;-><init>(Lorg/eclipse/jgit/revwalk/AbstractRevQueue$1;)V

    sput-object v0, Lorg/eclipse/jgit/revwalk/AbstractRevQueue;->EMPTY_QUEUE:Lorg/eclipse/jgit/revwalk/AbstractRevQueue;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .prologue
    .line 46
    invoke-direct {p0}, Lorg/eclipse/jgit/revwalk/Generator;-><init>()V

    .line 129
    return-void
.end method

.method protected static describe(Ljava/lang/StringBuilder;Lorg/eclipse/jgit/revwalk/RevCommit;)V
    .locals 1
    .parameter "s"
    .parameter "c"

    .prologue
    .line 125
    invoke-virtual {p1}, Lorg/eclipse/jgit/revwalk/RevCommit;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    const/16 v0, 0xa

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 127
    return-void
.end method


# virtual methods
.method public abstract add(Lorg/eclipse/jgit/revwalk/RevCommit;)V
.end method

.method public final add(Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/revwalk/RevFlag;)V
    .locals 1
    .parameter "c"
    .parameter "queueControl"

    .prologue
    .line 78
    invoke-virtual {p1, p2}, Lorg/eclipse/jgit/revwalk/RevCommit;->has(Lorg/eclipse/jgit/revwalk/RevFlag;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 79
    invoke-virtual {p1, p2}, Lorg/eclipse/jgit/revwalk/RevCommit;->add(Lorg/eclipse/jgit/revwalk/RevFlag;)V

    .line 80
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/revwalk/AbstractRevQueue;->add(Lorg/eclipse/jgit/revwalk/RevCommit;)V

    .line 82
    :cond_0
    return-void
.end method

.method public final addParents(Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/revwalk/RevFlag;)V
    .locals 5
    .parameter "c"
    .parameter "queueControl"

    .prologue
    .line 98
    iget-object v4, p1, Lorg/eclipse/jgit/revwalk/RevCommit;->parents:[Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 99
    .local v4, pList:[Lorg/eclipse/jgit/revwalk/RevCommit;
    if-nez v4, :cond_1

    .line 103
    :cond_0
    return-void

    .line 101
    :cond_1
    move-object v0, v4

    .local v0, arr$:[Lorg/eclipse/jgit/revwalk/RevCommit;
    array-length v2, v0

    .local v2, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v3, v0, v1

    .line 102
    .local v3, p:Lorg/eclipse/jgit/revwalk/RevCommit;
    invoke-virtual {p0, v3, p2}, Lorg/eclipse/jgit/revwalk/AbstractRevQueue;->add(Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/revwalk/RevFlag;)V

    .line 101
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method abstract anybodyHasFlag(I)Z
.end method

.method public abstract clear()V
.end method

.method abstract everbodyHasFlag(I)Z
.end method

.method public abstract next()Lorg/eclipse/jgit/revwalk/RevCommit;
.end method

.method outputType()I
    .locals 1

    .prologue
    .line 121
    iget v0, p0, Lorg/eclipse/jgit/revwalk/AbstractRevQueue;->outputType:I

    return v0
.end method

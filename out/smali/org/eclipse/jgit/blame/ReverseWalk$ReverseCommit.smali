.class final Lorg/eclipse/jgit/blame/ReverseWalk$ReverseCommit;
.super Lorg/eclipse/jgit/revwalk/RevCommit;
.source "ReverseWalk.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/blame/ReverseWalk;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ReverseCommit"
.end annotation


# static fields
.field private static final NO_CHILDREN:[Lorg/eclipse/jgit/blame/ReverseWalk$ReverseCommit;


# instance fields
.field private children:[Lorg/eclipse/jgit/blame/ReverseWalk$ReverseCommit;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 77
    const/4 v0, 0x0

    new-array v0, v0, [Lorg/eclipse/jgit/blame/ReverseWalk$ReverseCommit;

    sput-object v0, Lorg/eclipse/jgit/blame/ReverseWalk$ReverseCommit;->NO_CHILDREN:[Lorg/eclipse/jgit/blame/ReverseWalk$ReverseCommit;

    return-void
.end method

.method constructor <init>(Lorg/eclipse/jgit/lib/AnyObjectId;)V
    .locals 1
    .parameter "id"

    .prologue
    .line 82
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/revwalk/RevCommit;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 79
    sget-object v0, Lorg/eclipse/jgit/blame/ReverseWalk$ReverseCommit;->NO_CHILDREN:[Lorg/eclipse/jgit/blame/ReverseWalk$ReverseCommit;

    iput-object v0, p0, Lorg/eclipse/jgit/blame/ReverseWalk$ReverseCommit;->children:[Lorg/eclipse/jgit/blame/ReverseWalk$ReverseCommit;

    .line 83
    return-void
.end method


# virtual methods
.method addChild(Lorg/eclipse/jgit/blame/ReverseWalk$ReverseCommit;)V
    .locals 6
    .parameter "c"

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 92
    iget-object v2, p0, Lorg/eclipse/jgit/blame/ReverseWalk$ReverseCommit;->children:[Lorg/eclipse/jgit/blame/ReverseWalk$ReverseCommit;

    array-length v0, v2

    .line 93
    .local v0, cnt:I
    if-nez v0, :cond_0

    .line 94
    new-array v2, v5, [Lorg/eclipse/jgit/blame/ReverseWalk$ReverseCommit;

    aput-object p1, v2, v4

    iput-object v2, p0, Lorg/eclipse/jgit/blame/ReverseWalk$ReverseCommit;->children:[Lorg/eclipse/jgit/blame/ReverseWalk$ReverseCommit;

    .line 103
    :goto_0
    return-void

    .line 95
    :cond_0
    if-ne v0, v5, :cond_1

    .line 96
    const/4 v2, 0x2

    new-array v2, v2, [Lorg/eclipse/jgit/blame/ReverseWalk$ReverseCommit;

    aput-object p1, v2, v4

    iget-object v3, p0, Lorg/eclipse/jgit/blame/ReverseWalk$ReverseCommit;->children:[Lorg/eclipse/jgit/blame/ReverseWalk$ReverseCommit;

    aget-object v3, v3, v4

    aput-object v3, v2, v5

    iput-object v2, p0, Lorg/eclipse/jgit/blame/ReverseWalk$ReverseCommit;->children:[Lorg/eclipse/jgit/blame/ReverseWalk$ReverseCommit;

    goto :goto_0

    .line 98
    :cond_1
    add-int/lit8 v2, v0, 0x1

    new-array v1, v2, [Lorg/eclipse/jgit/blame/ReverseWalk$ReverseCommit;

    .line 99
    .local v1, n:[Lorg/eclipse/jgit/blame/ReverseWalk$ReverseCommit;
    aput-object p1, v1, v4

    .line 100
    iget-object v2, p0, Lorg/eclipse/jgit/blame/ReverseWalk$ReverseCommit;->children:[Lorg/eclipse/jgit/blame/ReverseWalk$ReverseCommit;

    invoke-static {v2, v4, v1, v5, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 101
    iput-object v1, p0, Lorg/eclipse/jgit/blame/ReverseWalk$ReverseCommit;->children:[Lorg/eclipse/jgit/blame/ReverseWalk$ReverseCommit;

    goto :goto_0
.end method

.method getChild(I)Lorg/eclipse/jgit/blame/ReverseWalk$ReverseCommit;
    .locals 1
    .parameter "nth"

    .prologue
    .line 110
    iget-object v0, p0, Lorg/eclipse/jgit/blame/ReverseWalk$ReverseCommit;->children:[Lorg/eclipse/jgit/blame/ReverseWalk$ReverseCommit;

    aget-object v0, v0, p1

    return-object v0
.end method

.method getChildCount()I
    .locals 1

    .prologue
    .line 106
    iget-object v0, p0, Lorg/eclipse/jgit/blame/ReverseWalk$ReverseCommit;->children:[Lorg/eclipse/jgit/blame/ReverseWalk$ReverseCommit;

    array-length v0, v0

    return v0
.end method

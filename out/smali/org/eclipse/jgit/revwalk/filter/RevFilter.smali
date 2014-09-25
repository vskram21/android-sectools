.class public abstract Lorg/eclipse/jgit/revwalk/filter/RevFilter;
.super Ljava/lang/Object;
.source "RevFilter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/revwalk/filter/RevFilter$1;,
        Lorg/eclipse/jgit/revwalk/filter/RevFilter$AllFilter;,
        Lorg/eclipse/jgit/revwalk/filter/RevFilter$MergeBaseFilter;,
        Lorg/eclipse/jgit/revwalk/filter/RevFilter$NoMergesFilter;,
        Lorg/eclipse/jgit/revwalk/filter/RevFilter$NoneFilter;
    }
.end annotation


# static fields
.field public static final ALL:Lorg/eclipse/jgit/revwalk/filter/RevFilter;

.field public static final MERGE_BASE:Lorg/eclipse/jgit/revwalk/filter/RevFilter;

.field public static final NONE:Lorg/eclipse/jgit/revwalk/filter/RevFilter;

.field public static final NO_MERGES:Lorg/eclipse/jgit/revwalk/filter/RevFilter;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 97
    new-instance v0, Lorg/eclipse/jgit/revwalk/filter/RevFilter$AllFilter;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/revwalk/filter/RevFilter$AllFilter;-><init>(Lorg/eclipse/jgit/revwalk/filter/RevFilter$1;)V

    sput-object v0, Lorg/eclipse/jgit/revwalk/filter/RevFilter;->ALL:Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    .line 122
    new-instance v0, Lorg/eclipse/jgit/revwalk/filter/RevFilter$NoneFilter;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/revwalk/filter/RevFilter$NoneFilter;-><init>(Lorg/eclipse/jgit/revwalk/filter/RevFilter$1;)V

    sput-object v0, Lorg/eclipse/jgit/revwalk/filter/RevFilter;->NONE:Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    .line 147
    new-instance v0, Lorg/eclipse/jgit/revwalk/filter/RevFilter$NoMergesFilter;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/revwalk/filter/RevFilter$NoMergesFilter;-><init>(Lorg/eclipse/jgit/revwalk/filter/RevFilter$1;)V

    sput-object v0, Lorg/eclipse/jgit/revwalk/filter/RevFilter;->NO_MERGES:Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    .line 179
    new-instance v0, Lorg/eclipse/jgit/revwalk/filter/RevFilter$MergeBaseFilter;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/revwalk/filter/RevFilter$MergeBaseFilter;-><init>(Lorg/eclipse/jgit/revwalk/filter/RevFilter$1;)V

    sput-object v0, Lorg/eclipse/jgit/revwalk/filter/RevFilter;->MERGE_BASE:Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 95
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 181
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
    .line 95
    invoke-virtual {p0}, Lorg/eclipse/jgit/revwalk/filter/RevFilter;->clone()Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    move-result-object v0

    return-object v0
.end method

.method public abstract clone()Lorg/eclipse/jgit/revwalk/filter/RevFilter;
.end method

.method public abstract include(Lorg/eclipse/jgit/revwalk/RevWalk;Lorg/eclipse/jgit/revwalk/RevCommit;)Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/StopWalkException;,
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public negate()Lorg/eclipse/jgit/revwalk/filter/RevFilter;
    .locals 1

    .prologue
    .line 209
    invoke-static {p0}, Lorg/eclipse/jgit/revwalk/filter/NotRevFilter;->create(Lorg/eclipse/jgit/revwalk/filter/RevFilter;)Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    move-result-object v0

    return-object v0
.end method

.method public requiresCommitBody()Z
    .locals 1

    .prologue
    .line 215
    const/4 v0, 0x1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    const/16 v3, 0x2e

    .line 261
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    .line 262
    .local v1, n:Ljava/lang/String;
    invoke-virtual {v1, v3}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    .line 263
    .local v0, lastDot:I
    if-ltz v0, :cond_0

    .line 264
    add-int/lit8 v2, v0, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 266
    :cond_0
    const/16 v2, 0x24

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

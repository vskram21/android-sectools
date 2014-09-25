.class public abstract Lorg/eclipse/jgit/treewalk/filter/TreeFilter;
.super Ljava/lang/Object;
.source "TreeFilter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/treewalk/filter/TreeFilter$1;,
        Lorg/eclipse/jgit/treewalk/filter/TreeFilter$AllFilter;,
        Lorg/eclipse/jgit/treewalk/filter/TreeFilter$AnyDiffFilter;
    }
.end annotation


# static fields
.field public static final ALL:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

.field public static final ANY_DIFF:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 89
    new-instance v0, Lorg/eclipse/jgit/treewalk/filter/TreeFilter$AllFilter;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/treewalk/filter/TreeFilter$AllFilter;-><init>(Lorg/eclipse/jgit/treewalk/filter/TreeFilter$1;)V

    sput-object v0, Lorg/eclipse/jgit/treewalk/filter/TreeFilter;->ALL:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    .line 129
    new-instance v0, Lorg/eclipse/jgit/treewalk/filter/TreeFilter$AnyDiffFilter;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/treewalk/filter/TreeFilter$AnyDiffFilter;-><init>(Lorg/eclipse/jgit/treewalk/filter/TreeFilter$1;)V

    sput-object v0, Lorg/eclipse/jgit/treewalk/filter/TreeFilter;->ANY_DIFF:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 87
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 131
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
    .line 87
    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/filter/TreeFilter;->clone()Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    move-result-object v0

    return-object v0
.end method

.method public abstract clone()Lorg/eclipse/jgit/treewalk/filter/TreeFilter;
.end method

.method public abstract include(Lorg/eclipse/jgit/treewalk/TreeWalk;)Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public negate()Lorg/eclipse/jgit/treewalk/filter/TreeFilter;
    .locals 1

    .prologue
    .line 169
    invoke-static {p0}, Lorg/eclipse/jgit/treewalk/filter/NotTreeFilter;->create(Lorg/eclipse/jgit/treewalk/filter/TreeFilter;)Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    move-result-object v0

    return-object v0
.end method

.method public abstract shouldBeRecursive()Z
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    const/16 v3, 0x2e

    .line 227
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    .line 228
    .local v1, n:Ljava/lang/String;
    invoke-virtual {v1, v3}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    .line 229
    .local v0, lastDot:I
    if-ltz v0, :cond_0

    .line 230
    add-int/lit8 v2, v0, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 232
    :cond_0
    const/16 v2, 0x24

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

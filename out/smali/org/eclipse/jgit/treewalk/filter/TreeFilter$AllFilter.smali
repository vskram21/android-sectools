.class final Lorg/eclipse/jgit/treewalk/filter/TreeFilter$AllFilter;
.super Lorg/eclipse/jgit/treewalk/filter/TreeFilter;
.source "TreeFilter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/treewalk/filter/TreeFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "AllFilter"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 91
    invoke-direct {p0}, Lorg/eclipse/jgit/treewalk/filter/TreeFilter;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/eclipse/jgit/treewalk/filter/TreeFilter$1;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 91
    invoke-direct {p0}, Lorg/eclipse/jgit/treewalk/filter/TreeFilter$AllFilter;-><init>()V

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
    .line 91
    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/filter/TreeFilter$AllFilter;->clone()Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lorg/eclipse/jgit/treewalk/filter/TreeFilter;
    .locals 0

    .prologue
    .line 104
    return-object p0
.end method

.method public include(Lorg/eclipse/jgit/treewalk/TreeWalk;)Z
    .locals 1
    .parameter "walker"

    .prologue
    .line 94
    const/4 v0, 0x1

    return v0
.end method

.method public shouldBeRecursive()Z
    .locals 1

    .prologue
    .line 99
    const/4 v0, 0x0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 109
    const-string v0, "ALL"

    return-object v0
.end method

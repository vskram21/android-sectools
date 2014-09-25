.class public abstract Lorg/eclipse/jgit/revwalk/filter/RevFlagFilter;
.super Lorg/eclipse/jgit/revwalk/filter/RevFilter;
.source "RevFlagFilter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/revwalk/filter/RevFlagFilter$HasAll;,
        Lorg/eclipse/jgit/revwalk/filter/RevFlagFilter$HasAny;
    }
.end annotation


# instance fields
.field final flags:Lorg/eclipse/jgit/revwalk/RevFlagSet;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/revwalk/RevFlagSet;)V
    .locals 0
    .parameter "m"

    .prologue
    .line 122
    invoke-direct {p0}, Lorg/eclipse/jgit/revwalk/filter/RevFilter;-><init>()V

    .line 123
    iput-object p1, p0, Lorg/eclipse/jgit/revwalk/filter/RevFlagFilter;->flags:Lorg/eclipse/jgit/revwalk/RevFlagSet;

    .line 124
    return-void
.end method

.method public static has(Lorg/eclipse/jgit/revwalk/RevFlag;)Lorg/eclipse/jgit/revwalk/filter/RevFilter;
    .locals 2
    .parameter "a"

    .prologue
    .line 65
    new-instance v0, Lorg/eclipse/jgit/revwalk/RevFlagSet;

    invoke-direct {v0}, Lorg/eclipse/jgit/revwalk/RevFlagSet;-><init>()V

    .line 66
    .local v0, s:Lorg/eclipse/jgit/revwalk/RevFlagSet;
    invoke-virtual {v0, p0}, Lorg/eclipse/jgit/revwalk/RevFlagSet;->add(Lorg/eclipse/jgit/revwalk/RevFlag;)Z

    .line 67
    new-instance v1, Lorg/eclipse/jgit/revwalk/filter/RevFlagFilter$HasAll;

    invoke-direct {v1, v0}, Lorg/eclipse/jgit/revwalk/filter/RevFlagFilter$HasAll;-><init>(Lorg/eclipse/jgit/revwalk/RevFlagSet;)V

    return-object v1
.end method

.method public static hasAll(Lorg/eclipse/jgit/revwalk/RevFlagSet;)Lorg/eclipse/jgit/revwalk/filter/RevFilter;
    .locals 2
    .parameter "a"

    .prologue
    .line 92
    new-instance v0, Lorg/eclipse/jgit/revwalk/filter/RevFlagFilter$HasAll;

    new-instance v1, Lorg/eclipse/jgit/revwalk/RevFlagSet;

    invoke-direct {v1, p0}, Lorg/eclipse/jgit/revwalk/RevFlagSet;-><init>(Lorg/eclipse/jgit/revwalk/RevFlagSet;)V

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/revwalk/filter/RevFlagFilter$HasAll;-><init>(Lorg/eclipse/jgit/revwalk/RevFlagSet;)V

    return-object v0
.end method

.method public static varargs hasAll([Lorg/eclipse/jgit/revwalk/RevFlag;)Lorg/eclipse/jgit/revwalk/filter/RevFilter;
    .locals 6
    .parameter "a"

    .prologue
    .line 78
    new-instance v4, Lorg/eclipse/jgit/revwalk/RevFlagSet;

    invoke-direct {v4}, Lorg/eclipse/jgit/revwalk/RevFlagSet;-><init>()V

    .line 79
    .local v4, set:Lorg/eclipse/jgit/revwalk/RevFlagSet;
    move-object v0, p0

    .local v0, arr$:[Lorg/eclipse/jgit/revwalk/RevFlag;
    array-length v3, v0

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_0
    if-ge v2, v3, :cond_0

    aget-object v1, v0, v2

    .line 80
    .local v1, flag:Lorg/eclipse/jgit/revwalk/RevFlag;
    invoke-virtual {v4, v1}, Lorg/eclipse/jgit/revwalk/RevFlagSet;->add(Lorg/eclipse/jgit/revwalk/RevFlag;)Z

    .line 79
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 81
    .end local v1           #flag:Lorg/eclipse/jgit/revwalk/RevFlag;
    :cond_0
    new-instance v5, Lorg/eclipse/jgit/revwalk/filter/RevFlagFilter$HasAll;

    invoke-direct {v5, v4}, Lorg/eclipse/jgit/revwalk/filter/RevFlagFilter$HasAll;-><init>(Lorg/eclipse/jgit/revwalk/RevFlagSet;)V

    return-object v5
.end method

.method public static hasAny(Lorg/eclipse/jgit/revwalk/RevFlagSet;)Lorg/eclipse/jgit/revwalk/filter/RevFilter;
    .locals 2
    .parameter "a"

    .prologue
    .line 117
    new-instance v0, Lorg/eclipse/jgit/revwalk/filter/RevFlagFilter$HasAny;

    new-instance v1, Lorg/eclipse/jgit/revwalk/RevFlagSet;

    invoke-direct {v1, p0}, Lorg/eclipse/jgit/revwalk/RevFlagSet;-><init>(Lorg/eclipse/jgit/revwalk/RevFlagSet;)V

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/revwalk/filter/RevFlagFilter$HasAny;-><init>(Lorg/eclipse/jgit/revwalk/RevFlagSet;)V

    return-object v0
.end method

.method public static varargs hasAny([Lorg/eclipse/jgit/revwalk/RevFlag;)Lorg/eclipse/jgit/revwalk/filter/RevFilter;
    .locals 6
    .parameter "a"

    .prologue
    .line 103
    new-instance v4, Lorg/eclipse/jgit/revwalk/RevFlagSet;

    invoke-direct {v4}, Lorg/eclipse/jgit/revwalk/RevFlagSet;-><init>()V

    .line 104
    .local v4, set:Lorg/eclipse/jgit/revwalk/RevFlagSet;
    move-object v0, p0

    .local v0, arr$:[Lorg/eclipse/jgit/revwalk/RevFlag;
    array-length v3, v0

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_0
    if-ge v2, v3, :cond_0

    aget-object v1, v0, v2

    .line 105
    .local v1, flag:Lorg/eclipse/jgit/revwalk/RevFlag;
    invoke-virtual {v4, v1}, Lorg/eclipse/jgit/revwalk/RevFlagSet;->add(Lorg/eclipse/jgit/revwalk/RevFlag;)Z

    .line 104
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 106
    .end local v1           #flag:Lorg/eclipse/jgit/revwalk/RevFlag;
    :cond_0
    new-instance v5, Lorg/eclipse/jgit/revwalk/filter/RevFlagFilter$HasAny;

    invoke-direct {v5, v4}, Lorg/eclipse/jgit/revwalk/filter/RevFlagFilter$HasAny;-><init>(Lorg/eclipse/jgit/revwalk/RevFlagSet;)V

    return-object v5
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
    .line 56
    invoke-virtual {p0}, Lorg/eclipse/jgit/revwalk/filter/RevFlagFilter;->clone()Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lorg/eclipse/jgit/revwalk/filter/RevFilter;
    .locals 0

    .prologue
    .line 128
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 133
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-super {p0}, Lorg/eclipse/jgit/revwalk/filter/RevFilter;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/eclipse/jgit/revwalk/filter/RevFlagFilter;->flags:Lorg/eclipse/jgit/revwalk/RevFlagSet;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

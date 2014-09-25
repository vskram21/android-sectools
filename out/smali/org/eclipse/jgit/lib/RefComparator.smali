.class public Lorg/eclipse/jgit/lib/RefComparator;
.super Ljava/lang/Object;
.source "RefComparator.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lorg/eclipse/jgit/lib/Ref;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lorg/eclipse/jgit/lib/RefComparator;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 61
    new-instance v0, Lorg/eclipse/jgit/lib/RefComparator;

    invoke-direct {v0}, Lorg/eclipse/jgit/lib/RefComparator;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/lib/RefComparator;->INSTANCE:Lorg/eclipse/jgit/lib/RefComparator;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static compareTo(Lorg/eclipse/jgit/lib/Ref;Ljava/lang/String;)I
    .locals 1
    .parameter "o1"
    .parameter "o2"

    .prologue
    .line 90
    invoke-interface {p0}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static compareTo(Lorg/eclipse/jgit/lib/Ref;Lorg/eclipse/jgit/lib/Ref;)I
    .locals 2
    .parameter "o1"
    .parameter "o2"

    .prologue
    .line 103
    invoke-interface {p0}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static sort(Ljava/util/Collection;)Ljava/util/Collection;
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;)",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;"
        }
    .end annotation

    .prologue
    .line 75
    .local p0, refs:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/lib/Ref;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 76
    .local v0, r:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/lib/Ref;>;"
    sget-object v1, Lorg/eclipse/jgit/lib/RefComparator;->INSTANCE:Lorg/eclipse/jgit/lib/RefComparator;

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 77
    return-object v0
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 58
    check-cast p1, Lorg/eclipse/jgit/lib/Ref;

    .end local p1
    check-cast p2, Lorg/eclipse/jgit/lib/Ref;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jgit/lib/RefComparator;->compare(Lorg/eclipse/jgit/lib/Ref;Lorg/eclipse/jgit/lib/Ref;)I

    move-result v0

    return v0
.end method

.method public compare(Lorg/eclipse/jgit/lib/Ref;Lorg/eclipse/jgit/lib/Ref;)I
    .locals 1
    .parameter "o1"
    .parameter "o2"

    .prologue
    .line 64
    invoke-static {p1, p2}, Lorg/eclipse/jgit/lib/RefComparator;->compareTo(Lorg/eclipse/jgit/lib/Ref;Lorg/eclipse/jgit/lib/Ref;)I

    move-result v0

    return v0
.end method

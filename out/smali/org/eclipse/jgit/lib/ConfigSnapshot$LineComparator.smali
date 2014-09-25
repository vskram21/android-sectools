.class Lorg/eclipse/jgit/lib/ConfigSnapshot$LineComparator;
.super Ljava/lang/Object;
.source "ConfigSnapshot.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/lib/ConfigSnapshot;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "LineComparator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lorg/eclipse/jgit/lib/ConfigLine;",
        ">;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 219
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/eclipse/jgit/lib/ConfigSnapshot$1;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 219
    invoke-direct {p0}, Lorg/eclipse/jgit/lib/ConfigSnapshot$LineComparator;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 219
    check-cast p1, Lorg/eclipse/jgit/lib/ConfigLine;

    .end local p1
    check-cast p2, Lorg/eclipse/jgit/lib/ConfigLine;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jgit/lib/ConfigSnapshot$LineComparator;->compare(Lorg/eclipse/jgit/lib/ConfigLine;Lorg/eclipse/jgit/lib/ConfigLine;)I

    move-result v0

    return v0
.end method

.method public compare(Lorg/eclipse/jgit/lib/ConfigLine;Lorg/eclipse/jgit/lib/ConfigLine;)I
    .locals 6
    .parameter "a"
    .parameter "b"

    .prologue
    .line 221
    iget-object v0, p1, Lorg/eclipse/jgit/lib/ConfigLine;->section:Ljava/lang/String;

    iget-object v1, p1, Lorg/eclipse/jgit/lib/ConfigLine;->subsection:Ljava/lang/String;

    iget-object v2, p1, Lorg/eclipse/jgit/lib/ConfigLine;->name:Ljava/lang/String;

    iget-object v3, p2, Lorg/eclipse/jgit/lib/ConfigLine;->section:Ljava/lang/String;

    iget-object v4, p2, Lorg/eclipse/jgit/lib/ConfigLine;->subsection:Ljava/lang/String;

    iget-object v5, p2, Lorg/eclipse/jgit/lib/ConfigLine;->name:Ljava/lang/String;

    #calls: Lorg/eclipse/jgit/lib/ConfigSnapshot;->compare2(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    invoke-static/range {v0 .. v5}, Lorg/eclipse/jgit/lib/ConfigSnapshot;->access$100(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

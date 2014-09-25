.class Lorg/eclipse/jgit/api/ListBranchCommand$1;
.super Ljava/lang/Object;
.source "ListBranchCommand.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/api/ListBranchCommand;->call()Ljava/util/List;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lorg/eclipse/jgit/lib/Ref;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jgit/api/ListBranchCommand;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/api/ListBranchCommand;)V
    .locals 0
    .parameter

    .prologue
    .line 128
    iput-object p1, p0, Lorg/eclipse/jgit/api/ListBranchCommand$1;->this$0:Lorg/eclipse/jgit/api/ListBranchCommand;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 128
    check-cast p1, Lorg/eclipse/jgit/lib/Ref;

    .end local p1
    check-cast p2, Lorg/eclipse/jgit/lib/Ref;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jgit/api/ListBranchCommand$1;->compare(Lorg/eclipse/jgit/lib/Ref;Lorg/eclipse/jgit/lib/Ref;)I

    move-result v0

    return v0
.end method

.method public compare(Lorg/eclipse/jgit/lib/Ref;Lorg/eclipse/jgit/lib/Ref;)I
    .locals 2
    .parameter "o1"
    .parameter "o2"

    .prologue
    .line 130
    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p2}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

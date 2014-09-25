.class public Lorg/eclipse/jgit/api/errors/CheckoutConflictException;
.super Lorg/eclipse/jgit/api/errors/GitAPIException;
.source "CheckoutConflictException.java"


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private conflictingPaths:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 0
    .parameter "message"

    .prologue
    .line 77
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/api/errors/GitAPIException;-><init>(Ljava/lang/String;)V

    .line 78
    return-void
.end method

.method constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0
    .parameter "message"
    .parameter "cause"

    .prologue
    .line 68
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/api/errors/GitAPIException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 69
    return-void
.end method

.method constructor <init>(Ljava/lang/String;Ljava/util/List;)V
    .locals 0
    .parameter "message"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 81
    .local p2, conflictingPaths:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/api/errors/GitAPIException;-><init>(Ljava/lang/String;)V

    .line 82
    iput-object p2, p0, Lorg/eclipse/jgit/api/errors/CheckoutConflictException;->conflictingPaths:Ljava/util/List;

    .line 83
    return-void
.end method

.method constructor <init>(Ljava/lang/String;Ljava/util/List;Ljava/lang/Throwable;)V
    .locals 0
    .parameter "message"
    .parameter
    .parameter "cause"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/Throwable;",
            ")V"
        }
    .end annotation

    .prologue
    .line 72
    .local p2, conflictingPaths:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    invoke-direct {p0, p1, p3}, Lorg/eclipse/jgit/api/errors/GitAPIException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 73
    iput-object p2, p0, Lorg/eclipse/jgit/api/errors/CheckoutConflictException;->conflictingPaths:Ljava/util/List;

    .line 74
    return-void
.end method

.method public constructor <init>(Ljava/util/List;Lorg/eclipse/jgit/errors/CheckoutConflictException;)V
    .locals 1
    .parameter
    .parameter "e"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Lorg/eclipse/jgit/errors/CheckoutConflictException;",
            ")V"
        }
    .end annotation

    .prologue
    .line 63
    .local p1, conflictingPaths:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    invoke-virtual {p2}, Lorg/eclipse/jgit/errors/CheckoutConflictException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Lorg/eclipse/jgit/api/errors/GitAPIException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 64
    iput-object p1, p0, Lorg/eclipse/jgit/api/errors/CheckoutConflictException;->conflictingPaths:Ljava/util/List;

    .line 65
    return-void
.end method


# virtual methods
.method addConflictingPath(Ljava/lang/String;)Lorg/eclipse/jgit/api/errors/CheckoutConflictException;
    .locals 1
    .parameter "conflictingPath"

    .prologue
    .line 97
    iget-object v0, p0, Lorg/eclipse/jgit/api/errors/CheckoutConflictException;->conflictingPaths:Ljava/util/List;

    if-nez v0, :cond_0

    .line 98
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/api/errors/CheckoutConflictException;->conflictingPaths:Ljava/util/List;

    .line 99
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/api/errors/CheckoutConflictException;->conflictingPaths:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 100
    return-object p0
.end method

.method public getConflictingPaths()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 87
    iget-object v0, p0, Lorg/eclipse/jgit/api/errors/CheckoutConflictException;->conflictingPaths:Ljava/util/List;

    return-object v0
.end method

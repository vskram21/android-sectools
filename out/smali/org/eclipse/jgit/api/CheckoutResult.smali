.class public Lorg/eclipse/jgit/api/CheckoutResult;
.super Ljava/lang/Object;
.source "CheckoutResult.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/api/CheckoutResult$Status;
    }
.end annotation


# static fields
.field public static final ERROR_RESULT:Lorg/eclipse/jgit/api/CheckoutResult;

.field public static final NOT_TRIED_RESULT:Lorg/eclipse/jgit/api/CheckoutResult;


# instance fields
.field private final conflictList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final modifiedList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final myStatus:Lorg/eclipse/jgit/api/CheckoutResult$Status;

.field private final removedList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final undeletedList:Ljava/util/List;
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
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 57
    new-instance v0, Lorg/eclipse/jgit/api/CheckoutResult;

    sget-object v1, Lorg/eclipse/jgit/api/CheckoutResult$Status;->ERROR:Lorg/eclipse/jgit/api/CheckoutResult$Status;

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/api/CheckoutResult;-><init>(Lorg/eclipse/jgit/api/CheckoutResult$Status;Ljava/util/List;)V

    sput-object v0, Lorg/eclipse/jgit/api/CheckoutResult;->ERROR_RESULT:Lorg/eclipse/jgit/api/CheckoutResult;

    .line 63
    new-instance v0, Lorg/eclipse/jgit/api/CheckoutResult;

    sget-object v1, Lorg/eclipse/jgit/api/CheckoutResult$Status;->NOT_TRIED:Lorg/eclipse/jgit/api/CheckoutResult$Status;

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/api/CheckoutResult;-><init>(Lorg/eclipse/jgit/api/CheckoutResult$Status;Ljava/util/List;)V

    sput-object v0, Lorg/eclipse/jgit/api/CheckoutResult;->NOT_TRIED_RESULT:Lorg/eclipse/jgit/api/CheckoutResult;

    return-void
.end method

.method constructor <init>(Ljava/util/List;Ljava/util/List;)V
    .locals 2
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, modified:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    .local p2, removed:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    const/4 v1, 0x0

    .line 138
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 139
    sget-object v0, Lorg/eclipse/jgit/api/CheckoutResult$Status;->OK:Lorg/eclipse/jgit/api/CheckoutResult$Status;

    iput-object v0, p0, Lorg/eclipse/jgit/api/CheckoutResult;->myStatus:Lorg/eclipse/jgit/api/CheckoutResult$Status;

    .line 141
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lorg/eclipse/jgit/api/CheckoutResult;->conflictList:Ljava/util/List;

    .line 142
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lorg/eclipse/jgit/api/CheckoutResult;->undeletedList:Ljava/util/List;

    .line 144
    iput-object p1, p0, Lorg/eclipse/jgit/api/CheckoutResult;->modifiedList:Ljava/util/List;

    .line 145
    iput-object p2, p0, Lorg/eclipse/jgit/api/CheckoutResult;->removedList:Ljava/util/List;

    .line 146
    return-void
.end method

.method constructor <init>(Lorg/eclipse/jgit/api/CheckoutResult$Status;Ljava/util/List;)V
    .locals 2
    .parameter "status"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/api/CheckoutResult$Status;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p2, fileList:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    const/4 v1, 0x0

    .line 115
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 116
    iput-object p1, p0, Lorg/eclipse/jgit/api/CheckoutResult;->myStatus:Lorg/eclipse/jgit/api/CheckoutResult$Status;

    .line 117
    sget-object v0, Lorg/eclipse/jgit/api/CheckoutResult$Status;->CONFLICTS:Lorg/eclipse/jgit/api/CheckoutResult$Status;

    if-ne p1, v0, :cond_0

    .line 118
    iput-object p2, p0, Lorg/eclipse/jgit/api/CheckoutResult;->conflictList:Ljava/util/List;

    .line 121
    :goto_0
    sget-object v0, Lorg/eclipse/jgit/api/CheckoutResult$Status;->NONDELETED:Lorg/eclipse/jgit/api/CheckoutResult$Status;

    if-ne p1, v0, :cond_1

    .line 122
    iput-object p2, p0, Lorg/eclipse/jgit/api/CheckoutResult;->undeletedList:Ljava/util/List;

    .line 126
    :goto_1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lorg/eclipse/jgit/api/CheckoutResult;->modifiedList:Ljava/util/List;

    .line 127
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lorg/eclipse/jgit/api/CheckoutResult;->removedList:Ljava/util/List;

    .line 128
    return-void

    .line 120
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lorg/eclipse/jgit/api/CheckoutResult;->conflictList:Ljava/util/List;

    goto :goto_0

    .line 124
    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lorg/eclipse/jgit/api/CheckoutResult;->undeletedList:Ljava/util/List;

    goto :goto_1
.end method


# virtual methods
.method public getConflictList()Ljava/util/List;
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
    .line 160
    iget-object v0, p0, Lorg/eclipse/jgit/api/CheckoutResult;->conflictList:Ljava/util/List;

    return-object v0
.end method

.method public getModifiedList()Ljava/util/List;
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
    .line 177
    iget-object v0, p0, Lorg/eclipse/jgit/api/CheckoutResult;->modifiedList:Ljava/util/List;

    return-object v0
.end method

.method public getRemovedList()Ljava/util/List;
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
    .line 185
    iget-object v0, p0, Lorg/eclipse/jgit/api/CheckoutResult;->removedList:Ljava/util/List;

    return-object v0
.end method

.method public getStatus()Lorg/eclipse/jgit/api/CheckoutResult$Status;
    .locals 1

    .prologue
    .line 152
    iget-object v0, p0, Lorg/eclipse/jgit/api/CheckoutResult;->myStatus:Lorg/eclipse/jgit/api/CheckoutResult$Status;

    return-object v0
.end method

.method public getUndeletedList()Ljava/util/List;
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
    .line 169
    iget-object v0, p0, Lorg/eclipse/jgit/api/CheckoutResult;->undeletedList:Ljava/util/List;

    return-object v0
.end method

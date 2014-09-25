.class public final enum Lorg/eclipse/jgit/revwalk/RevSort;
.super Ljava/lang/Enum;
.source "RevSort.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/eclipse/jgit/revwalk/RevSort;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/eclipse/jgit/revwalk/RevSort;

.field public static final enum BOUNDARY:Lorg/eclipse/jgit/revwalk/RevSort;

.field public static final enum COMMIT_TIME_DESC:Lorg/eclipse/jgit/revwalk/RevSort;

.field public static final enum NONE:Lorg/eclipse/jgit/revwalk/RevSort;

.field public static final enum REVERSE:Lorg/eclipse/jgit/revwalk/RevSort;

.field public static final enum TOPO:Lorg/eclipse/jgit/revwalk/RevSort;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 56
    new-instance v0, Lorg/eclipse/jgit/revwalk/RevSort;

    const-string v1, "NONE"

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/revwalk/RevSort;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/revwalk/RevSort;->NONE:Lorg/eclipse/jgit/revwalk/RevSort;

    .line 63
    new-instance v0, Lorg/eclipse/jgit/revwalk/RevSort;

    const-string v1, "COMMIT_TIME_DESC"

    invoke-direct {v0, v1, v3}, Lorg/eclipse/jgit/revwalk/RevSort;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/revwalk/RevSort;->COMMIT_TIME_DESC:Lorg/eclipse/jgit/revwalk/RevSort;

    .line 70
    new-instance v0, Lorg/eclipse/jgit/revwalk/RevSort;

    const-string v1, "TOPO"

    invoke-direct {v0, v1, v4}, Lorg/eclipse/jgit/revwalk/RevSort;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/revwalk/RevSort;->TOPO:Lorg/eclipse/jgit/revwalk/RevSort;

    .line 78
    new-instance v0, Lorg/eclipse/jgit/revwalk/RevSort;

    const-string v1, "REVERSE"

    invoke-direct {v0, v1, v5}, Lorg/eclipse/jgit/revwalk/RevSort;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/revwalk/RevSort;->REVERSE:Lorg/eclipse/jgit/revwalk/RevSort;

    .line 89
    new-instance v0, Lorg/eclipse/jgit/revwalk/RevSort;

    const-string v1, "BOUNDARY"

    invoke-direct {v0, v1, v6}, Lorg/eclipse/jgit/revwalk/RevSort;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/revwalk/RevSort;->BOUNDARY:Lorg/eclipse/jgit/revwalk/RevSort;

    .line 48
    const/4 v0, 0x5

    new-array v0, v0, [Lorg/eclipse/jgit/revwalk/RevSort;

    sget-object v1, Lorg/eclipse/jgit/revwalk/RevSort;->NONE:Lorg/eclipse/jgit/revwalk/RevSort;

    aput-object v1, v0, v2

    sget-object v1, Lorg/eclipse/jgit/revwalk/RevSort;->COMMIT_TIME_DESC:Lorg/eclipse/jgit/revwalk/RevSort;

    aput-object v1, v0, v3

    sget-object v1, Lorg/eclipse/jgit/revwalk/RevSort;->TOPO:Lorg/eclipse/jgit/revwalk/RevSort;

    aput-object v1, v0, v4

    sget-object v1, Lorg/eclipse/jgit/revwalk/RevSort;->REVERSE:Lorg/eclipse/jgit/revwalk/RevSort;

    aput-object v1, v0, v5

    sget-object v1, Lorg/eclipse/jgit/revwalk/RevSort;->BOUNDARY:Lorg/eclipse/jgit/revwalk/RevSort;

    aput-object v1, v0, v6

    sput-object v0, Lorg/eclipse/jgit/revwalk/RevSort;->$VALUES:[Lorg/eclipse/jgit/revwalk/RevSort;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 48
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/eclipse/jgit/revwalk/RevSort;
    .locals 1
    .parameter "name"

    .prologue
    .line 48
    const-class v0, Lorg/eclipse/jgit/revwalk/RevSort;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/revwalk/RevSort;

    return-object v0
.end method

.method public static values()[Lorg/eclipse/jgit/revwalk/RevSort;
    .locals 1

    .prologue
    .line 48
    sget-object v0, Lorg/eclipse/jgit/revwalk/RevSort;->$VALUES:[Lorg/eclipse/jgit/revwalk/RevSort;

    invoke-virtual {v0}, [Lorg/eclipse/jgit/revwalk/RevSort;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/eclipse/jgit/revwalk/RevSort;

    return-object v0
.end method

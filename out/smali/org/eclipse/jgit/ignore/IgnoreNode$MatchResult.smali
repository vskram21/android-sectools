.class public final enum Lorg/eclipse/jgit/ignore/IgnoreNode$MatchResult;
.super Ljava/lang/Enum;
.source "IgnoreNode.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/ignore/IgnoreNode;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "MatchResult"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/eclipse/jgit/ignore/IgnoreNode$MatchResult;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/eclipse/jgit/ignore/IgnoreNode$MatchResult;

.field public static final enum CHECK_PARENT:Lorg/eclipse/jgit/ignore/IgnoreNode$MatchResult;

.field public static final enum IGNORED:Lorg/eclipse/jgit/ignore/IgnoreNode$MatchResult;

.field public static final enum NOT_IGNORED:Lorg/eclipse/jgit/ignore/IgnoreNode$MatchResult;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 64
    new-instance v0, Lorg/eclipse/jgit/ignore/IgnoreNode$MatchResult;

    const-string v1, "NOT_IGNORED"

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/ignore/IgnoreNode$MatchResult;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/ignore/IgnoreNode$MatchResult;->NOT_IGNORED:Lorg/eclipse/jgit/ignore/IgnoreNode$MatchResult;

    .line 67
    new-instance v0, Lorg/eclipse/jgit/ignore/IgnoreNode$MatchResult;

    const-string v1, "IGNORED"

    invoke-direct {v0, v1, v3}, Lorg/eclipse/jgit/ignore/IgnoreNode$MatchResult;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/ignore/IgnoreNode$MatchResult;->IGNORED:Lorg/eclipse/jgit/ignore/IgnoreNode$MatchResult;

    .line 70
    new-instance v0, Lorg/eclipse/jgit/ignore/IgnoreNode$MatchResult;

    const-string v1, "CHECK_PARENT"

    invoke-direct {v0, v1, v4}, Lorg/eclipse/jgit/ignore/IgnoreNode$MatchResult;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/ignore/IgnoreNode$MatchResult;->CHECK_PARENT:Lorg/eclipse/jgit/ignore/IgnoreNode$MatchResult;

    .line 62
    const/4 v0, 0x3

    new-array v0, v0, [Lorg/eclipse/jgit/ignore/IgnoreNode$MatchResult;

    sget-object v1, Lorg/eclipse/jgit/ignore/IgnoreNode$MatchResult;->NOT_IGNORED:Lorg/eclipse/jgit/ignore/IgnoreNode$MatchResult;

    aput-object v1, v0, v2

    sget-object v1, Lorg/eclipse/jgit/ignore/IgnoreNode$MatchResult;->IGNORED:Lorg/eclipse/jgit/ignore/IgnoreNode$MatchResult;

    aput-object v1, v0, v3

    sget-object v1, Lorg/eclipse/jgit/ignore/IgnoreNode$MatchResult;->CHECK_PARENT:Lorg/eclipse/jgit/ignore/IgnoreNode$MatchResult;

    aput-object v1, v0, v4

    sput-object v0, Lorg/eclipse/jgit/ignore/IgnoreNode$MatchResult;->$VALUES:[Lorg/eclipse/jgit/ignore/IgnoreNode$MatchResult;

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
    .line 62
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/eclipse/jgit/ignore/IgnoreNode$MatchResult;
    .locals 1
    .parameter "name"

    .prologue
    .line 62
    const-class v0, Lorg/eclipse/jgit/ignore/IgnoreNode$MatchResult;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/ignore/IgnoreNode$MatchResult;

    return-object v0
.end method

.method public static values()[Lorg/eclipse/jgit/ignore/IgnoreNode$MatchResult;
    .locals 1

    .prologue
    .line 62
    sget-object v0, Lorg/eclipse/jgit/ignore/IgnoreNode$MatchResult;->$VALUES:[Lorg/eclipse/jgit/ignore/IgnoreNode$MatchResult;

    invoke-virtual {v0}, [Lorg/eclipse/jgit/ignore/IgnoreNode$MatchResult;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/eclipse/jgit/ignore/IgnoreNode$MatchResult;

    return-object v0
.end method

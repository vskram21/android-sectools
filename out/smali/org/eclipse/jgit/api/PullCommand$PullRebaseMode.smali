.class final enum Lorg/eclipse/jgit/api/PullCommand$PullRebaseMode;
.super Ljava/lang/Enum;
.source "PullCommand.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/api/PullCommand;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "PullRebaseMode"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/eclipse/jgit/api/PullCommand$PullRebaseMode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/eclipse/jgit/api/PullCommand$PullRebaseMode;

.field public static final enum NO_REBASE:Lorg/eclipse/jgit/api/PullCommand$PullRebaseMode;

.field public static final enum REBASE:Lorg/eclipse/jgit/api/PullCommand$PullRebaseMode;

.field public static final enum USE_CONFIG:Lorg/eclipse/jgit/api/PullCommand$PullRebaseMode;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 93
    new-instance v0, Lorg/eclipse/jgit/api/PullCommand$PullRebaseMode;

    const-string v1, "USE_CONFIG"

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/api/PullCommand$PullRebaseMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/api/PullCommand$PullRebaseMode;->USE_CONFIG:Lorg/eclipse/jgit/api/PullCommand$PullRebaseMode;

    .line 94
    new-instance v0, Lorg/eclipse/jgit/api/PullCommand$PullRebaseMode;

    const-string v1, "REBASE"

    invoke-direct {v0, v1, v3}, Lorg/eclipse/jgit/api/PullCommand$PullRebaseMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/api/PullCommand$PullRebaseMode;->REBASE:Lorg/eclipse/jgit/api/PullCommand$PullRebaseMode;

    .line 95
    new-instance v0, Lorg/eclipse/jgit/api/PullCommand$PullRebaseMode;

    const-string v1, "NO_REBASE"

    invoke-direct {v0, v1, v4}, Lorg/eclipse/jgit/api/PullCommand$PullRebaseMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/api/PullCommand$PullRebaseMode;->NO_REBASE:Lorg/eclipse/jgit/api/PullCommand$PullRebaseMode;

    .line 92
    const/4 v0, 0x3

    new-array v0, v0, [Lorg/eclipse/jgit/api/PullCommand$PullRebaseMode;

    sget-object v1, Lorg/eclipse/jgit/api/PullCommand$PullRebaseMode;->USE_CONFIG:Lorg/eclipse/jgit/api/PullCommand$PullRebaseMode;

    aput-object v1, v0, v2

    sget-object v1, Lorg/eclipse/jgit/api/PullCommand$PullRebaseMode;->REBASE:Lorg/eclipse/jgit/api/PullCommand$PullRebaseMode;

    aput-object v1, v0, v3

    sget-object v1, Lorg/eclipse/jgit/api/PullCommand$PullRebaseMode;->NO_REBASE:Lorg/eclipse/jgit/api/PullCommand$PullRebaseMode;

    aput-object v1, v0, v4

    sput-object v0, Lorg/eclipse/jgit/api/PullCommand$PullRebaseMode;->$VALUES:[Lorg/eclipse/jgit/api/PullCommand$PullRebaseMode;

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
    .line 92
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/eclipse/jgit/api/PullCommand$PullRebaseMode;
    .locals 1
    .parameter "name"

    .prologue
    .line 92
    const-class v0, Lorg/eclipse/jgit/api/PullCommand$PullRebaseMode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/api/PullCommand$PullRebaseMode;

    return-object v0
.end method

.method public static values()[Lorg/eclipse/jgit/api/PullCommand$PullRebaseMode;
    .locals 1

    .prologue
    .line 92
    sget-object v0, Lorg/eclipse/jgit/api/PullCommand$PullRebaseMode;->$VALUES:[Lorg/eclipse/jgit/api/PullCommand$PullRebaseMode;

    invoke-virtual {v0}, [Lorg/eclipse/jgit/api/PullCommand$PullRebaseMode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/eclipse/jgit/api/PullCommand$PullRebaseMode;

    return-object v0
.end method

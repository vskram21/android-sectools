.class public final enum Lorg/eclipse/jgit/api/CreateBranchCommand$SetupUpstreamMode;
.super Ljava/lang/Enum;
.source "CreateBranchCommand.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/api/CreateBranchCommand;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "SetupUpstreamMode"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/eclipse/jgit/api/CreateBranchCommand$SetupUpstreamMode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/eclipse/jgit/api/CreateBranchCommand$SetupUpstreamMode;

.field public static final enum NOTRACK:Lorg/eclipse/jgit/api/CreateBranchCommand$SetupUpstreamMode;

.field public static final enum SET_UPSTREAM:Lorg/eclipse/jgit/api/CreateBranchCommand$SetupUpstreamMode;

.field public static final enum TRACK:Lorg/eclipse/jgit/api/CreateBranchCommand$SetupUpstreamMode;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 94
    new-instance v0, Lorg/eclipse/jgit/api/CreateBranchCommand$SetupUpstreamMode;

    const-string v1, "TRACK"

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/api/CreateBranchCommand$SetupUpstreamMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/api/CreateBranchCommand$SetupUpstreamMode;->TRACK:Lorg/eclipse/jgit/api/CreateBranchCommand$SetupUpstreamMode;

    .line 98
    new-instance v0, Lorg/eclipse/jgit/api/CreateBranchCommand$SetupUpstreamMode;

    const-string v1, "NOTRACK"

    invoke-direct {v0, v1, v3}, Lorg/eclipse/jgit/api/CreateBranchCommand$SetupUpstreamMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/api/CreateBranchCommand$SetupUpstreamMode;->NOTRACK:Lorg/eclipse/jgit/api/CreateBranchCommand$SetupUpstreamMode;

    .line 102
    new-instance v0, Lorg/eclipse/jgit/api/CreateBranchCommand$SetupUpstreamMode;

    const-string v1, "SET_UPSTREAM"

    invoke-direct {v0, v1, v4}, Lorg/eclipse/jgit/api/CreateBranchCommand$SetupUpstreamMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/api/CreateBranchCommand$SetupUpstreamMode;->SET_UPSTREAM:Lorg/eclipse/jgit/api/CreateBranchCommand$SetupUpstreamMode;

    .line 90
    const/4 v0, 0x3

    new-array v0, v0, [Lorg/eclipse/jgit/api/CreateBranchCommand$SetupUpstreamMode;

    sget-object v1, Lorg/eclipse/jgit/api/CreateBranchCommand$SetupUpstreamMode;->TRACK:Lorg/eclipse/jgit/api/CreateBranchCommand$SetupUpstreamMode;

    aput-object v1, v0, v2

    sget-object v1, Lorg/eclipse/jgit/api/CreateBranchCommand$SetupUpstreamMode;->NOTRACK:Lorg/eclipse/jgit/api/CreateBranchCommand$SetupUpstreamMode;

    aput-object v1, v0, v3

    sget-object v1, Lorg/eclipse/jgit/api/CreateBranchCommand$SetupUpstreamMode;->SET_UPSTREAM:Lorg/eclipse/jgit/api/CreateBranchCommand$SetupUpstreamMode;

    aput-object v1, v0, v4

    sput-object v0, Lorg/eclipse/jgit/api/CreateBranchCommand$SetupUpstreamMode;->$VALUES:[Lorg/eclipse/jgit/api/CreateBranchCommand$SetupUpstreamMode;

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
    .line 90
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/eclipse/jgit/api/CreateBranchCommand$SetupUpstreamMode;
    .locals 1
    .parameter "name"

    .prologue
    .line 90
    const-class v0, Lorg/eclipse/jgit/api/CreateBranchCommand$SetupUpstreamMode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/api/CreateBranchCommand$SetupUpstreamMode;

    return-object v0
.end method

.method public static values()[Lorg/eclipse/jgit/api/CreateBranchCommand$SetupUpstreamMode;
    .locals 1

    .prologue
    .line 90
    sget-object v0, Lorg/eclipse/jgit/api/CreateBranchCommand$SetupUpstreamMode;->$VALUES:[Lorg/eclipse/jgit/api/CreateBranchCommand$SetupUpstreamMode;

    invoke-virtual {v0}, [Lorg/eclipse/jgit/api/CreateBranchCommand$SetupUpstreamMode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/eclipse/jgit/api/CreateBranchCommand$SetupUpstreamMode;

    return-object v0
.end method

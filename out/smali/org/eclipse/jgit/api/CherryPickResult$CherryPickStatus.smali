.class public enum Lorg/eclipse/jgit/api/CherryPickResult$CherryPickStatus;
.super Ljava/lang/Enum;
.source "CherryPickResult.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/api/CherryPickResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4009
    name = "CherryPickStatus"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/eclipse/jgit/api/CherryPickResult$CherryPickStatus;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/eclipse/jgit/api/CherryPickResult$CherryPickStatus;

.field public static final enum CONFLICTING:Lorg/eclipse/jgit/api/CherryPickResult$CherryPickStatus;

.field public static final enum FAILED:Lorg/eclipse/jgit/api/CherryPickResult$CherryPickStatus;

.field public static final enum OK:Lorg/eclipse/jgit/api/CherryPickResult$CherryPickStatus;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 63
    new-instance v0, Lorg/eclipse/jgit/api/CherryPickResult$CherryPickStatus$1;

    const-string v1, "OK"

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/api/CherryPickResult$CherryPickStatus$1;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/api/CherryPickResult$CherryPickStatus;->OK:Lorg/eclipse/jgit/api/CherryPickResult$CherryPickStatus;

    .line 70
    new-instance v0, Lorg/eclipse/jgit/api/CherryPickResult$CherryPickStatus$2;

    const-string v1, "FAILED"

    invoke-direct {v0, v1, v3}, Lorg/eclipse/jgit/api/CherryPickResult$CherryPickStatus$2;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/api/CherryPickResult$CherryPickStatus;->FAILED:Lorg/eclipse/jgit/api/CherryPickResult$CherryPickStatus;

    .line 77
    new-instance v0, Lorg/eclipse/jgit/api/CherryPickResult$CherryPickStatus$3;

    const-string v1, "CONFLICTING"

    invoke-direct {v0, v1, v4}, Lorg/eclipse/jgit/api/CherryPickResult$CherryPickStatus$3;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/api/CherryPickResult$CherryPickStatus;->CONFLICTING:Lorg/eclipse/jgit/api/CherryPickResult$CherryPickStatus;

    .line 61
    const/4 v0, 0x3

    new-array v0, v0, [Lorg/eclipse/jgit/api/CherryPickResult$CherryPickStatus;

    sget-object v1, Lorg/eclipse/jgit/api/CherryPickResult$CherryPickStatus;->OK:Lorg/eclipse/jgit/api/CherryPickResult$CherryPickStatus;

    aput-object v1, v0, v2

    sget-object v1, Lorg/eclipse/jgit/api/CherryPickResult$CherryPickStatus;->FAILED:Lorg/eclipse/jgit/api/CherryPickResult$CherryPickStatus;

    aput-object v1, v0, v3

    sget-object v1, Lorg/eclipse/jgit/api/CherryPickResult$CherryPickStatus;->CONFLICTING:Lorg/eclipse/jgit/api/CherryPickResult$CherryPickStatus;

    aput-object v1, v0, v4

    sput-object v0, Lorg/eclipse/jgit/api/CherryPickResult$CherryPickStatus;->$VALUES:[Lorg/eclipse/jgit/api/CherryPickResult$CherryPickStatus;

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
    .line 61
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;ILorg/eclipse/jgit/api/CherryPickResult$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 61
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/api/CherryPickResult$CherryPickStatus;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/eclipse/jgit/api/CherryPickResult$CherryPickStatus;
    .locals 1
    .parameter "name"

    .prologue
    .line 61
    const-class v0, Lorg/eclipse/jgit/api/CherryPickResult$CherryPickStatus;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/api/CherryPickResult$CherryPickStatus;

    return-object v0
.end method

.method public static values()[Lorg/eclipse/jgit/api/CherryPickResult$CherryPickStatus;
    .locals 1

    .prologue
    .line 61
    sget-object v0, Lorg/eclipse/jgit/api/CherryPickResult$CherryPickStatus;->$VALUES:[Lorg/eclipse/jgit/api/CherryPickResult$CherryPickStatus;

    invoke-virtual {v0}, [Lorg/eclipse/jgit/api/CherryPickResult$CherryPickStatus;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/eclipse/jgit/api/CherryPickResult$CherryPickStatus;

    return-object v0
.end method

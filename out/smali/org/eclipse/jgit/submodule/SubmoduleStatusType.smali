.class public final enum Lorg/eclipse/jgit/submodule/SubmoduleStatusType;
.super Ljava/lang/Enum;
.source "SubmoduleStatusType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/eclipse/jgit/submodule/SubmoduleStatusType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/eclipse/jgit/submodule/SubmoduleStatusType;

.field public static final enum INITIALIZED:Lorg/eclipse/jgit/submodule/SubmoduleStatusType;

.field public static final enum MISSING:Lorg/eclipse/jgit/submodule/SubmoduleStatusType;

.field public static final enum REV_CHECKED_OUT:Lorg/eclipse/jgit/submodule/SubmoduleStatusType;

.field public static final enum UNINITIALIZED:Lorg/eclipse/jgit/submodule/SubmoduleStatusType;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 51
    new-instance v0, Lorg/eclipse/jgit/submodule/SubmoduleStatusType;

    const-string v1, "MISSING"

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/submodule/SubmoduleStatusType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/submodule/SubmoduleStatusType;->MISSING:Lorg/eclipse/jgit/submodule/SubmoduleStatusType;

    .line 54
    new-instance v0, Lorg/eclipse/jgit/submodule/SubmoduleStatusType;

    const-string v1, "UNINITIALIZED"

    invoke-direct {v0, v1, v3}, Lorg/eclipse/jgit/submodule/SubmoduleStatusType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/submodule/SubmoduleStatusType;->UNINITIALIZED:Lorg/eclipse/jgit/submodule/SubmoduleStatusType;

    .line 57
    new-instance v0, Lorg/eclipse/jgit/submodule/SubmoduleStatusType;

    const-string v1, "INITIALIZED"

    invoke-direct {v0, v1, v4}, Lorg/eclipse/jgit/submodule/SubmoduleStatusType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/submodule/SubmoduleStatusType;->INITIALIZED:Lorg/eclipse/jgit/submodule/SubmoduleStatusType;

    .line 63
    new-instance v0, Lorg/eclipse/jgit/submodule/SubmoduleStatusType;

    const-string v1, "REV_CHECKED_OUT"

    invoke-direct {v0, v1, v5}, Lorg/eclipse/jgit/submodule/SubmoduleStatusType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/submodule/SubmoduleStatusType;->REV_CHECKED_OUT:Lorg/eclipse/jgit/submodule/SubmoduleStatusType;

    .line 48
    const/4 v0, 0x4

    new-array v0, v0, [Lorg/eclipse/jgit/submodule/SubmoduleStatusType;

    sget-object v1, Lorg/eclipse/jgit/submodule/SubmoduleStatusType;->MISSING:Lorg/eclipse/jgit/submodule/SubmoduleStatusType;

    aput-object v1, v0, v2

    sget-object v1, Lorg/eclipse/jgit/submodule/SubmoduleStatusType;->UNINITIALIZED:Lorg/eclipse/jgit/submodule/SubmoduleStatusType;

    aput-object v1, v0, v3

    sget-object v1, Lorg/eclipse/jgit/submodule/SubmoduleStatusType;->INITIALIZED:Lorg/eclipse/jgit/submodule/SubmoduleStatusType;

    aput-object v1, v0, v4

    sget-object v1, Lorg/eclipse/jgit/submodule/SubmoduleStatusType;->REV_CHECKED_OUT:Lorg/eclipse/jgit/submodule/SubmoduleStatusType;

    aput-object v1, v0, v5

    sput-object v0, Lorg/eclipse/jgit/submodule/SubmoduleStatusType;->$VALUES:[Lorg/eclipse/jgit/submodule/SubmoduleStatusType;

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

.method public static valueOf(Ljava/lang/String;)Lorg/eclipse/jgit/submodule/SubmoduleStatusType;
    .locals 1
    .parameter "name"

    .prologue
    .line 48
    const-class v0, Lorg/eclipse/jgit/submodule/SubmoduleStatusType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/submodule/SubmoduleStatusType;

    return-object v0
.end method

.method public static values()[Lorg/eclipse/jgit/submodule/SubmoduleStatusType;
    .locals 1

    .prologue
    .line 48
    sget-object v0, Lorg/eclipse/jgit/submodule/SubmoduleStatusType;->$VALUES:[Lorg/eclipse/jgit/submodule/SubmoduleStatusType;

    invoke-virtual {v0}, [Lorg/eclipse/jgit/submodule/SubmoduleStatusType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/eclipse/jgit/submodule/SubmoduleStatusType;

    return-object v0
.end method

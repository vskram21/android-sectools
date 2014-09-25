.class public Lorg/eclipse/jgit/util/FS_POSIX_Java6;
.super Lorg/eclipse/jgit/util/FS_POSIX;
.source "FS_POSIX_Java6.java"


# static fields
.field private static final canExecute:Ljava/lang/reflect/Method;

.field private static final setExecute:Ljava/lang/reflect/Method;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 64
    const-class v0, Ljava/io/File;

    const-string v1, "canExecute"

    new-array v2, v4, [Ljava/lang/Class;

    invoke-static {v0, v1, v2}, Lorg/eclipse/jgit/util/FS_POSIX_Java6;->needMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lorg/eclipse/jgit/util/FS_POSIX_Java6;->canExecute:Ljava/lang/reflect/Method;

    .line 65
    const-class v0, Ljava/io/File;

    const-string v1, "setExecutable"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Class;

    sget-object v3, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v3, v2, v4

    invoke-static {v0, v1, v2}, Lorg/eclipse/jgit/util/FS_POSIX_Java6;->needMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lorg/eclipse/jgit/util/FS_POSIX_Java6;->setExecute:Ljava/lang/reflect/Method;

    .line 66
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 91
    invoke-direct {p0}, Lorg/eclipse/jgit/util/FS_POSIX;-><init>()V

    .line 92
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jgit/util/FS;)V
    .locals 0
    .parameter "src"

    .prologue
    .line 101
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/util/FS_POSIX;-><init>(Lorg/eclipse/jgit/util/FS;)V

    .line 102
    return-void
.end method

.method public static hasExecute()Z
    .locals 1

    .prologue
    .line 73
    sget-object v0, Lorg/eclipse/jgit/util/FS_POSIX_Java6;->canExecute:Ljava/lang/reflect/Method;

    if-eqz v0, :cond_0

    sget-object v0, Lorg/eclipse/jgit/util/FS_POSIX_Java6;->setExecute:Ljava/lang/reflect/Method;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static varargs needMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    .locals 2
    .parameter
    .parameter "name"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/reflect/Method;"
        }
    .end annotation

    .prologue
    .local p0, on:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    .local p2, args:[Ljava/lang/Class;,"[Ljava/lang/Class<*>;"
    const/4 v1, 0x0

    .line 79
    :try_start_0
    invoke-virtual {p0, p1, p2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v1

    .line 83
    :goto_0
    return-object v1

    .line 80
    :catch_0
    move-exception v0

    .line 81
    .local v0, e:Ljava/lang/SecurityException;
    goto :goto_0

    .line 82
    .end local v0           #e:Ljava/lang/SecurityException;
    :catch_1
    move-exception v0

    .line 83
    .local v0, e:Ljava/lang/NoSuchMethodException;
    goto :goto_0
.end method


# virtual methods
.method public canExecute(Ljava/io/File;)Z
    .locals 4
    .parameter "f"

    .prologue
    .line 115
    :try_start_0
    sget-object v3, Lorg/eclipse/jgit/util/FS_POSIX_Java6;->canExecute:Ljava/lang/reflect/Method;

    const/4 v2, 0x0

    check-cast v2, [Ljava/lang/Object;

    invoke-virtual {v3, p1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 116
    .local v1, r:Ljava/lang/Object;
    check-cast v1, Ljava/lang/Boolean;

    .end local v1           #r:Ljava/lang/Object;
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_2

    move-result v2

    return v2

    .line 117
    :catch_0
    move-exception v0

    .line 118
    .local v0, e:Ljava/lang/IllegalArgumentException;
    new-instance v2, Ljava/lang/Error;

    invoke-direct {v2, v0}, Ljava/lang/Error;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 119
    .end local v0           #e:Ljava/lang/IllegalArgumentException;
    :catch_1
    move-exception v0

    .line 120
    .local v0, e:Ljava/lang/IllegalAccessException;
    new-instance v2, Ljava/lang/Error;

    invoke-direct {v2, v0}, Ljava/lang/Error;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 121
    .end local v0           #e:Ljava/lang/IllegalAccessException;
    :catch_2
    move-exception v0

    .line 122
    .local v0, e:Ljava/lang/reflect/InvocationTargetException;
    new-instance v2, Ljava/lang/Error;

    invoke-direct {v2, v0}, Ljava/lang/Error;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public newInstance()Lorg/eclipse/jgit/util/FS;
    .locals 1

    .prologue
    .line 106
    new-instance v0, Lorg/eclipse/jgit/util/FS_POSIX_Java6;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/util/FS_POSIX_Java6;-><init>(Lorg/eclipse/jgit/util/FS;)V

    return-object v0
.end method

.method public retryFailedLockFileCommit()Z
    .locals 1

    .prologue
    .line 142
    const/4 v0, 0x0

    return v0
.end method

.method public setExecute(Ljava/io/File;Z)Z
    .locals 6
    .parameter "f"
    .parameter "canExec"

    .prologue
    .line 129
    :try_start_0
    sget-object v2, Lorg/eclipse/jgit/util/FS_POSIX_Java6;->setExecute:Ljava/lang/reflect/Method;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v2, p1, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 130
    .local v1, r:Ljava/lang/Object;
    check-cast v1, Ljava/lang/Boolean;

    .end local v1           #r:Ljava/lang/Object;
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_2

    move-result v2

    return v2

    .line 131
    :catch_0
    move-exception v0

    .line 132
    .local v0, e:Ljava/lang/IllegalArgumentException;
    new-instance v2, Ljava/lang/Error;

    invoke-direct {v2, v0}, Ljava/lang/Error;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 133
    .end local v0           #e:Ljava/lang/IllegalArgumentException;
    :catch_1
    move-exception v0

    .line 134
    .local v0, e:Ljava/lang/IllegalAccessException;
    new-instance v2, Ljava/lang/Error;

    invoke-direct {v2, v0}, Ljava/lang/Error;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 135
    .end local v0           #e:Ljava/lang/IllegalAccessException;
    :catch_2
    move-exception v0

    .line 136
    .local v0, e:Ljava/lang/reflect/InvocationTargetException;
    new-instance v2, Ljava/lang/Error;

    invoke-direct {v2, v0}, Ljava/lang/Error;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public supportsExecute()Z
    .locals 1

    .prologue
    .line 110
    const/4 v0, 0x1

    return v0
.end method

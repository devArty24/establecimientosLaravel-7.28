<?php

namespace App\Policies;

use App\User;
use App\establecimiento;
use Illuminate\Auth\Access\HandlesAuthorization;

class EstablecimientoPolicy
{
    use HandlesAuthorization;

    /**
     * Determine whether the user can view any models.
     *
     * @param  \App\User  $user
     * @return mixed
     */
    public function viewAny(User $user)
    {
        //
    }

    /**
     * Determine whether the user can view the model.
     *
     * @param  \App\User  $user
     * @param  \App\establecimiento  $establecimiento
     * @return mixed
     */
    public function view(User $user, establecimiento $establecimiento)
    {
        //
    }

    /**
     * Determine whether the user can create models.
     *
     * @param  \App\User  $user
     * @return mixed
     */
    public function create(User $user)
    {
        //
    }

    /**
     * Determine whether the user can update the model.
     *
     * @param  \App\User  $user
     * @param  \App\establecimiento  $establecimiento
     * @return mixed
     */
    public function update(User $user, establecimiento $establecimiento)
    {
        return $user->id === $establecimiento->user_id;
    }

    /**
     * Determine whether the user can delete the model.
     *
     * @param  \App\User  $user
     * @param  \App\establecimiento  $establecimiento
     * @return mixed
     */
    public function delete(User $user, establecimiento $establecimiento)
    {
        return $user->id === $establecimiento->user_id;
    }

    /**
     * Determine whether the user can restore the model.
     *
     * @param  \App\User  $user
     * @param  \App\establecimiento  $establecimiento
     * @return mixed
     */
    public function restore(User $user, establecimiento $establecimiento)
    {
        //
    }

    /**
     * Determine whether the user can permanently delete the model.
     *
     * @param  \App\User  $user
     * @param  \App\establecimiento  $establecimiento
     * @return mixed
     */
    public function forceDelete(User $user, establecimiento $establecimiento)
    {
        //
    }
}
